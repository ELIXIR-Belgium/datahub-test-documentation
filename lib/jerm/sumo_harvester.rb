module Jerm
  class SumoHarvester < WikiHarvester
    
    def update    
      resources = changed_since(last_run)
      resources.each do |resource|
        populate resource
      end
    end
    
    def changed_since(date)
      @changed_since_date = date
      
      @visited_links = Array.new
      @resources = Array.new
      
      get_links("http://sysmo-sumo.mpi-magdeburg.mpg.de/trac/wiki/LIMS/Experiments", 0)
      return @resources.uniq
    end
  
    private
    
     #Get links from a page and search them for experiment templates
    def get_links(target, level)
      links = Array.new
  
      #Start the search on the Data page
      doc = open(target, :http_basic_authentication=>[@username, @password]) { |f| Hpricot(f) }
      doc.search("/html/body/div#main/div#content//a").each do |e|
        uri = e.attributes['href']
        if uri.starts_with?("/trac/wiki/LIMS/Experiments/")
          links << complete_url(uri, extract_base_url(target))
        end      
      end
      
      links.uniq.each do |link|
        unless @visited_links.include?(link)
          @searched_uris = Array.new    
          @data_files = Array.new
          @sops = Array.new
          @experimenters = Array.new
          @section = "none"
          @title = ""
          @valid_template = false
          @visited_links << link
          get_data(link, (level+1))
        end
      end
    end
    
    def get_data(uri, level)    
      #Open the page, using the cookie returned from the log in
      doc = open(uri, :http_basic_authentication=>[@username, @password]) { |f| Hpricot(f) }
      #Examine all of the <a> tags with class "attachment" in the content div
      doc.search("/html/body/div#main/div#content//").each do |e|
        case e.name
          when "p"
            if e.attributes['class'] == "path"
              @section = "path"
            end
          when "h1"
            @title += " " + e.inner_html
            @title.strip!
          when "h2", "h3"
            @section = e.inner_html
          when "table"
            if @section == "General Data"
              @valid_template = true
              general_data = {}
              rows = e.search("//tr")
              #Make a hash with the items from the first column as the key
              # and the items from the second column as the value
              rows.each do |row|
                cols = row.search("//td")
                general_data[cols.first.inner_html.strip] = cols.last.inner_html.strip 
              end
              
              general_data.each_key do |k|
                if k.downcase.starts_with?("author")
                  @author = general_data[k]
                elsif k.downcase.starts_with?("date")
                  @date = general_data[k]              
                end              
              end
              
            end
            
            if @section == "Experimenters"
              #Get the experimenters names from the table (1st column)
              rows = e.search("//tr")
              rows.each do |row|
                unless row == rows.first
                  cols = row.search("//td")
                  cell = cols[0].inner_html.strip
                  if cell =~ /[a-zA-Z]+/
                    @experimenters << cell 
                  end
                end
              end
            end
            
            if @section == "Applied SOPs"
              rows = e.search("//tr")
              rows.each do |row|
                #skip first row (titles)
                unless row == rows.first
                  cols = row.search("//td")
                  #Get the SOP names from the table (1st column)              
                  cell = cols[0]
                  #Get the URL to the SOP from the table cell
                  sop_link = cell.at("a")
                  unless sop_link.nil?
                    resource_uri = complete_url(sop_link['href'], extract_base_url(uri))
                    @sops ||= []
                    @sops << resource_uri
                  end
                end
              end
            end
          
          #Get the attached data files from the links with class 'attachment'
          when "a"
            if @section == "path" && e.inner_html.starts_with?("WP")
              @WP = e.inner_html.split("WP").last.to_f / 10            
            end
            unless e.attributes['href'].nil?
              resource_uri = e.attributes['href']    
              #sort out relative paths
              resource_uri = complete_url(resource_uri, extract_base_url(uri))
              
              #Don't visit timeline links, anchors, or pages already visited.
              unless (resource_uri.include?("timeline?") || resource_uri.starts_with?("#") || @searched_uris.include?(resource_uri))
                #Remember we've visited this link
                @searched_uris << resource_uri
                #Get file extension
                #extension = resource_uri.split(".").last
                #If valid data file, remember it
                #if FILE_EXTENSIONS.include?(extension)
                if @section == "Attachments"
                  @data_files << resource_uri
                else
                  @data_files << resource_uri if e.attributes['class'] == "attachment"
                end
                  
                #If link wasn't a data file, but contains the word 'data' and is a wiki page, search it.
                #elsif resource_uri.starts_with?(root_uri) && (resource_uri.include?("data") || resource_uri.include?("Data"))        
                #  get_data(resource_uri, (level+1))
                #end          
              end        
            end
        end
      end
      
      
      #Print out what we've found
      if @valid_template
        unless @sops.empty?
          @sops.each do |s|
            res = Resource.new
            res.uri = s
            res.type = "Sop"
            res.project = "SUMO"
            unless @author.nil?
              first_name, last_name = @author.split(" ", 2)
              res.author_first_name = first_name
              res.author_last_name = last_name
            end
            @resources << res
          end
        end
        
        unless @data_files.empty?
          @data_files.each do |s|
            res = Resource.new
            res.uri = s
            res.type = "DataFile"
            res.project = "SUMO"
            unless @author.nil?
              first_name, last_name = @author.split(" ", 2)
              res.author_first_name = first_name
              res.author_last_name = last_name
            end
            @resources << res
          end
        end 
  
      else
        get_links(uri, level)
      end
    end
  end
end