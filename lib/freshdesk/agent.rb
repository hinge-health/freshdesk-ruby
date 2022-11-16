module Freshdesk
    class Agent < FreshdeskObject
      class << self
        def create_a_agent(params: {})
          new("/agents").resource(params: params).post
        end
  
        def view_a_agent(id:, query: "")
          new("/agents/#{id}#{query}").resource(id: id).get
        end
  
        def list_all_agents(query: "")
          new("/agents#{query}").resource.get
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
  
        def list_all_agent_fields
          new("/agent_fields").resource.get
        end
  
        def list_all_conversations_of_a_agent(id:)
          new("/agents/#{id}/conversations").resource(id: id).get
        end
  
        def list_all_time_entries_of_a_agent(id:)
          new("/agents/#{id}/time_entries").resource(id: id).get
        end
  
        def list_all_satisfaction_ratings_of_a_agent(agent_id:)
          new("/agents/#{agent_id}/satisfaction_ratings").resource.get
        end
      end
    end
  end
  