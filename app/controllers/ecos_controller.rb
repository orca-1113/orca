class EcosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create] 
    def index
       
        if params[:search] == nil
            @ecos= Eco.all
          elsif params[:search] == ''
            @ecos= Eco.all
          else
            @ecos = Eco.where("about LIKE ? ",'%' + params[:search] + '%')
          end

          if params[:tag_ids]
            @ecos = []
            params[:tag_ids].each do |key, value|
              if value == "1"
                tag_ecos = Tag.find_by(name: key).ecos
                @ecos = @ecos.empty? ? tag_ecos : @ecos & tag_ecos
              end
            end
          end
    end


    def top
    end
     



    def new
        @eco = Eco.new
      end
    
      def create
        eco = Eco.new(eco_params)

        eco.user_id = current_user.id

        if eco.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def edit
        @eco = Eco.find(params[:id])
      end

      def update
        eco = Eco.find(params[:id])
        if eco.update(eco_params)
          redirect_to :action => "index", :id => eco.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        eco = Eco.find(params[:id])
        eco.destroy
        redirect_to action: :index
      end


      private
      def eco_params
        params.require(:eco).permit(:about, :user_id, tag_ids: [])
      end


    
        
end
