# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_name = Array["Nicolas", "Nadya", "Martin", "Mathieu", "Patrick", "David", "Mathieu", "Thomas", "Serge", "Francis", "Mathieu", "David", "Nicolas", "David", "Remi", "Timothy", "Kiril", "Emmanuela", "Abdul", "Krista", "Jonathan"]
last_name = Array["Genest", "Fortier", "Chantal", "Houde", "Tibault", "Boutin", "Lortie", "Carrier", "Savoie", "Patry-Jessop", "Lefrancois", "Larochelle", "Pineault", "Amyot", "Gagnon", "Wever", "Kleinerman", "Derilus", "Akeeb", "Sheely", "Murray"]
function = Array["CEO", "Director", "Assistant Director", "Captain", "Captain", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Developer", "Developer", "Developer", "Developer", "Developer", "Developer"]
email = Array["nicolas.genest@***REMOVED***.biz", "nadya.fortier@***REMOVED***.biz", "martin.chantal@***REMOVED***.biz", "mathieu.houde@***REMOVED***.biz", "patrick.thibault@***REMOVED***.biz", "david.boutin@***REMOVED***.biz", "mathieu.lortie@***REMOVED***.biz", "thomas.carrier@***REMOVED***.biz", "serge.savoie@***REMOVED***.biz", "francis.patry-jessop@***REMOVED***.biz", "mathieu.lefrancois@***REMOVED***.biz", "david.larochelle@***REMOVED***.biz", "nicolas.pineault@***REMOVED***.biz", "david.amyot@***REMOVED***.biz", "remi.gagnon@***REMOVED***.biz", "timothy.wever@***REMOVED***.biz", "kiril.kleinerman@***REMOVED***.biz", "emmanuela.derilus@***REMOVED***.biz", "abdul.akeeb@***REMOVED***.biz", "krista.sheely@***REMOVED***.biz", "jonathan.murray@***REMOVED***.biz"]

for i in 0...first_name.length()
    Employee.create(first_name:first_name[i], last_name:last_name[i], function:function[i], email:email[i])
end

