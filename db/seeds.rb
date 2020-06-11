# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spinner = TTY::Spinner.new("Creating Mining Types :spinner", format: :dots)
spinner.auto_spin
    mining_types = [
            {description: 'Proof os Work',
            acronym: "PoW"
            },
            
            {  
            description:"Proof of Stake",
            acronym:"PoS"
            },
            
            {
            description:"Proof of Capacity",
            acronym:"PoC"
            }
            ]

    mining_types.each do |mining_type|
        MiningType.find_or_create_by(mining_type)
    end
spinner.success("Mining Types Created")