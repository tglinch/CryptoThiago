module ApplicationHelper
   
    def data_br(data_us)
        data_us.strftime("%d.%m.%Y")
    end
    
    def nome_app
        "Crypto Wallet"
    end
    
    def ambiente_rails
        if Rails.env.development?
            "Desenvolcimento"
        elsif Rails.env.production?
            "Produção"
        else
            "Teste"
        end
    end
end
