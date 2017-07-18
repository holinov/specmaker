# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fi1 = FieldInfo.create(name: 'Вес', unit_name: 'кг', sort_order: '0')
fi2 = FieldInfo.create(name: 'Ширина', unit_name: 'мм', sort_order: '1')
fi3 = FieldInfo.create(name: 'Длина', unit_name: 'мм', sort_order: '2')
fi4 = FieldInfo.create(name: 'Высота', unit_name: 'мм', sort_order: '3')

g1 = Group.create(name: 'test')
g2 = Group.create(name: 'sub_test', group_id: g1.id)

e1 = EntryInfo.create(name: 'pump', group: g1)
e2 = EntryInfo.create(name: 'pump1', group: g2)


[e1, e2].each do |x|
  f1 = Field.create(value: 1, field_info: fi1, entry_info: x)
  f2 = Field.create(value: 2, field_info: fi2, entry_info: x)
  f3 = Field.create(value: 3, field_info: fi3, entry_info: x)
  f4 = Field.create(value: 4, field_info: fi4, entry_info: x)
end


wi1 = WorkInfo.create(name: 'w1', amount: 10, units: 'hrs', price: 3.14, entry_info: e1)
wi1 = WorkInfo.create(name: 'w2', amount: 10, units: 'hrs', price: 3.14, entry_info: e1)

p1 = Project.create(name: 'prj1', desc: 'test project 1')

Entry.create(project: p1, entry_info: e1, amount: 10)
