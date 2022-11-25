module Freshdesk
    class Contact < FreshdeskObject
      class << self
        def create_a_contact(params: {})
          new("/contacts").resource(params: params).post
        end
  
        def view_a_contact(id:, params: {})
          new("/contacts/#{id}").resource(id: id, params: params).get
        end
  
        def list_all_contacts(params: {})
          new("/contacts").resource(params: params).get
        end

        def search_contacts(keyword: '')
          new("/contacts/autocomplete").resource(params: {term: keyword}).get
        end

        def filter_contacts(query: '')
          new("/search/contacts?query=\"#{URI.encode(query)}\"").resource.get
        end
  
        def update_a_contact(id:, params: {})
          new("/contacts/#{id}").resource(id: id, params: params).put
        end
  
        def delete_a_contact(id:)
          new("/contacts/#{id}").resource(id: id).delete
        end
  
        def restore_a_contact(id:)
          new("/contacts/#{id}/restore").resource(id: id).put
        end
      end
    end
  end
  