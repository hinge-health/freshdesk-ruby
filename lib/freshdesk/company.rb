module Freshdesk
    class Company < FreshdeskObject
      class << self
        def create_a_company(params: {})
          new("/companies").resource(params: params).post
        end
  
        def view_a_company(id:, params: {})
          new("/companies/#{id}").resource(id: id, params: params).get
        end
  
        def list_all_companies(params: {})
          new("/companies").resource(params: params).get
        end

        def search_companies(params: {})
          new("/companies/autocomplete").resource(params: params).get
        end

        def filter_companies(query: '')
          new("/search/companies?query=\"#{URI.encode(query)}\"").resource.get
        end
  
        def update_a_company(id:, params: {})
          new("/companies/#{id}").resource(id: id, params: params).put
        end
  
        def delete_a_company(id:)
          new("/companies/#{id}").resource(id: id).delete
        end
  
        def restore_a_company(id:)
          new("/companies/#{id}/restore").resource(id: id).put
        end
      end
    end
  end
  