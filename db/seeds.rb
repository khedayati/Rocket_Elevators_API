# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_names = Array["Nicolas", "Nadya", "Martin", "Mathieu", "Patrick", "David", "Mathieu", "Thomas", "Serge", "Francis", "Mathieu", "David", "Nicolas", "David", "Remi", "Timothy", "Kiril", "Emmanuela", "Abdul", "Krista", "Jonathan"]
last_names = Array["Genest", "Fortier", "Chantal", "Houde", "Tibault", "Boutin", "Lortie", "Carrier", "Savoie", "Patry-Jessop", "Lefrancois", "Larochelle", "Pineault", "Amyot", "Gagnon", "Wever", "Kleinerman", "Derilus", "Akeeb", "Sheely", "Murray"]
functions = Array["CEO", "Director", "Assistant Director", "Captain", "Captain", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Engineer", "Developer", "Developer", "Developer", "Developer", "Developer", "Developer"]
emails = Array["nicolas.genest@codeboxx.biz", "nadya.fortier@codeboxx.biz", "martin.chantal@codeboxx.biz", "mathieu.houde@codeboxx.biz", "patrick.thibault@codeboxx.biz", "david.boutin@codeboxx.biz", "mathieu.lortie@codeboxx.biz", "thomas.carrier@codeboxx.biz", "serge.savoie@codeboxx.biz", "francis.patry-jessop@codeboxx.biz", "mathieu.lefrancois@codeboxx.biz", "david.larochelle@codeboxx.biz", "nicolas.pineault@codeboxx.biz", "david.amyot@codeboxx.biz", "remi.gagnon@codeboxx.biz", "timothy.wever@codeboxx.biz", "kiril.kleinerman@codeboxx.biz", "emmanuela.derilus@codeboxx.biz", "abdul.akeeb@codeboxx.biz", "krista.sheely@codeboxx.biz", "jonathan.murray@codeboxx.biz"]

=begin for i in 0...first_name.length()
    @user = User.create!(email: email[i], password: 'password', password_confirmation: 'password', first_name:first_name[i], last_name:last_name[i], function:function[i])
    puts @user
    Employee.create!(first_name:first_name[i], last_name:last_name[i], function:function[i], email:email[i])
end
=end

first_names.each_with_index do |first_name, index|

    puts index
    puts first_name

    @user = User.create(email: emails[index], 
    password: 'password', 
    password_confirmation: 'password', 
    first_name:first_names[index], 
    last_name:last_names[index], 
    function:functions[index])

    if @user and @user.valid?
        puts "will create employee"   
        Employee.create!(first_name:first_names[index], last_name:last_names[index], function:functions[index], email:emails[index], user: @user)
    end

end