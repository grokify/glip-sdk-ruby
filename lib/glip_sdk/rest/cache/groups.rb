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
      if groups.is_a? Array
        groups.each { |g| load_group g }
      elsif groups.is_a? Hash
        groups.each { |_, g| load_group g}
      end
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

    def id_by_name(name)
      group = by_name name
      group.nil? ? nil : group['id']
    end

    def by_name(name)
      team = team_by_name name
      return team unless team.nil?
      group_by_name name
    end

    def team_by_name(name)
      team_id = @teams_name2id[name.to_s]
      team_id ? @teams[team_id] : nil
    end

    def group_by_name(name)
      group_id = @groups_name2id[name.to_s]
      group_id ? @groups[group_id] : nil
    end
  end
end
