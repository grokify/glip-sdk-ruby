module GlipSdk::REST::Cache
  class Groups
    attr_accessor :groups
    attr_accessor :groups_name2id
    attr_accessor :teams
    attr_accessor :teams_name2id
    def initialize
      @groups = {}
      @teams = {}
      @teams_name2id = {}
      @groups_name2id = {}
    end

    def load_groups(groups)
      groups.each { |g| load_group g }
    end

    def load_group(group)
      if group.key? 'id'
        id = group['id']
        type = group['type']
        if type.to_s.downcase == 'team'
          @teams[id.to_s] = group
          @teams_name2id[group['name']] = id.to_s
        else
          @groups[id.to_s] = group
          @groups_name2id[group['name']] = id.to_s
        end
      end
    end

    def team_by_name(name)
      # Innovation & Ops Extended Staff
      @teams[name.to_s]
    end
  end
end
