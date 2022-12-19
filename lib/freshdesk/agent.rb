module Freshdesk
    class Agent < FreshdeskObject
      class << self
        def create_a_agent(params: {})
          new("/agents").resource(params: params).post
        end
  
        def view_a_agent(id:, params: {})
          new("/agents/#{id}").resource(id: id, params: params).get
        end
  
        def list_all_agents(params: {})
          new("/agents").resource(params: params).get
        end
  
        def update_a_agent(id:, params: {})
          new("/agents/#{id}").resource(id: id, params: params).put
        end
  
        def delete_a_agent(id:)
          new("/agents/#{id}").resource(id: id).delete
        end
  
        def restore_a_agent(id:)
          new("/agents/#{id}/restore").resource(id: id).put
        end
      end
    end
  end
  