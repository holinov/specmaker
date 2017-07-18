require 'rails_helper'

RSpec.describe Group do
  let(:parent_name) { 'parent group' }
  let(:child_name1) { 'child group1' }
  let(:child_name2) { 'child group2' }
  let(:parent) { Group.create(name: parent_name) }
  let(:child1) { Group.create(name: child_name1, group_id: parent.id) }
  let(:child2) { Group.create(name: child_name2, group_id: child1.id) }

  it 'renders correct name' do
    expect(child1.render).to eq("#{parent_name} / #{child_name1}")
    expect(child2.render).to eq("#{parent_name} / #{child_name1} / #{child_name2}")
  end
end