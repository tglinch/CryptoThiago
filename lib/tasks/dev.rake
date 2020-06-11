namespace :dev do
  desc "Configura o ambiente de desenvolvimento."
  task setup: :environment do
    if Rails.env.development?
    
      show_spinner("Deleting DB") { %x(rails db:drop) }
   
      show_spinner("Creating DB") { %x(rails db:create) }
   
      show_spinner("Migrating DB") { %x(rails db:migrate) }
      
      %x(rails dev:add_miningtypes)
   
      %x(rails dev:add_coins)
    end
  end
  
  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Signing Up Coins") do
     coins = [
              {description: 'Bitcoin',
              acronym: "BTC",
              url_image: "https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png",
              mining_type: MiningType.find_by(acronym: "Pow")
              },
              
              {  
              description:"Dash",
              acronym:"DASH",
              url_image:"https://i7.pngflow.com/pngimage/37/123/png-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text-rectangle-clipart.png",
              mining_type: MiningType.all.sample
              },
              
              {
              description:"LiteCoin",
              acronym:"LTC",
              url_image:"https://img2.gratispng.com/20180525/wal/kisspng-litecoin-cryptocurrency-bitcoin-logo-cryptocurrency-5b081f1979b524.5871818715272589054985.jpg",
              mining_type: MiningType.find_by(acronym: "Pow")
              },
              
              {
              description:"LinchCoin",
              acronym:"LCH",
              url_image:"https://cainhoyathletic.com/wp-content/uploads/2016/04/lch-logo.png",
              mining_type: MiningType.all.sample
              },
              
              {
              description:"Ethereum",
              acronym:"ETC",
              url_image:"https://cryptologos.cc/logos/ethereum-eth-logo.png",
              mining_type: MiningType.all.sample
              }
              ]

        coins.each do |coin|
            Coin.find_or_create_by!(coin)
        end
      end
    end
    
  desc "Configura o ambiente de desenvolvimento."
  task add_miningtypes: :environment do
    show_spinner("Signing Up Mining Types") do
    mining_types = [
              {description: "Proof of Work", acronym: "Pow"},
              {description: "Proof of Stake", acronym: "PoS"},
              {description: "Proof of Capacity", acronym: "PoC"}
              ]
      mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
      end
    end
  end
  
  
  private

  def show_spinner(msg_start, msg_end = "OK")
      spinner = TTY::Spinner.new(":spinner #{msg_start}", format: :dots)
      spinner.auto_spin
      yield
      spinner.success
  end
end