class UtilisateursController < InheritedResources::Base

  private

    def utilisateur_params
      params.require(:utilisateur).permit(:name, :email)
    end

end
