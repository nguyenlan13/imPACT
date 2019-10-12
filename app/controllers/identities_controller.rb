class IdentitiesController < ApplicationController

    def index
        @identities = Identity.all
    end

    def new

    end

    def create

    end

    def show
        @identity = Identity.find(params[:id])
    end
end
