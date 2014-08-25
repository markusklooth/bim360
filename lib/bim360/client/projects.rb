require "bim360/project"
require "bim360/contact"

module Bim360
  class Client

    # Methods for the Projects API

    module Projects

      # Get all projects for the logged in user
      # 
      # @param options [Hash] options
      # @return [Sawyer::Resource]
      def all_projects(options = {})

        resp = get Project.path, options
        objects_from_response(resp, Bim360::Project)

      end

      # Get a single project
      #
      # @param options [GUID] BIM360-Field project_id.
      # @return [Sawyer::Resource]
      # @example
      #   Bim360.project("4689d194-0a74-11e3-89a6-02cc3afa57bd")
      def project(options = {})
        options = {project_id: options} if options.is_a?(String)
        project_id      = options.fetch(:project_id, @project_id)
        options[:query] = {project_id: project_id}
        resp = get Project.path(project_id), options
        Bim360::Project.new(resp)
        # objects_from_response(resp, Bim360::Project)
      end

      
      def project_folders(options = {})
        project_id      = options.fetch(:project_id, @project_id)
        # raise Bim360::MissingParams("project_id is not set") if @project_id.nil?
        post "/api/library/all_folders", {project_id: project_id}
      end


      def project_files(options = {})
        project_id      = options.fetch(:project_id, @project_id)
        # raise Bim360::MissingParams("project_id is not set") if @project_id.nil?
        post "/api/library/all_files", {project_id: project_id}
      end 


      def project_companies(options = {})
        project_id      = options.fetch(:project_id, @project_id)
        # raise Bim360::MissingParams("project_id is not set") if @project_id.nil?
        resp            = post "/api/companies", {project_id: project_id}


      end

      def project_contacts(options = {})
        # raise Bim360::MissingParams("project_id is not set") if @project_id.nil?
        project_id      = options.fetch(:project_id, @project_id)
        resp            = post "/api/contacts", {project_id: project_id}
        objects_from_response(resp, Bim360::Contact)

      end


      protected 

      # def 
      # :created_at=>2014-03-07 13:57:24 -0800, 
      # :revision_count=>1, 
      # :num_pages=>29, 
      # :parent_id=>nil, 
      # :fcreate_date=>2014-03-07 13:52:01 -0800, 
      # :pending=>false, 
      # :width=>2160, 
      # :caption=>nil, 
      # :base_revision_id=>nil, 
      # :vela_viewer_image_sizes=>
      # :locations =>["Building A>Floor 1>Room 101"], 
      # :tags=>"", 
      # :height=>3024, 
      # :updated_at=>2014-03-12 16:37:15 -0700, 
      # :path=>"706 PDFs for Field Testing/Str - Combined Files", 
      # :revision_position=>0, 
      # :document_id=>"778672f1-a643-11e3-8705-027465b920a7"

    end

  end
end