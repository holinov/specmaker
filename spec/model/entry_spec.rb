require 'rails_helper'

RSpec.describe Entry do
  let(group1) { Group.create(name: 'g1') }
  let(group2) { Group.create(name: 'g2', group_id: group1.id) }
end