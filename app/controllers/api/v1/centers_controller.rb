module api
  module v1

    class CentersController < ApplicationController
      respond_to :json
      before_filter :allow_cross_domain_access

      def index
        if params.include?("name")
          search = params["name"].titleize
          centers = Center.where("name like ?", "%#{search}%")
          respond_with centers, :except => [:created_at, :updated_at]
        elsif params.include?("state")
          search = params["state"].titleize
          centers = Center.where("state like ?", "%#{search}%")
          respond_with centers, :except => [:created_at, :updated_at]
        elsif params.include?("zip")
          search = params["zip"].titleize
          centers = Center.where("zip like ?", "%#{search}%")
          respond_with centers, :except => [:created_at, :updated_at]
        else
          centers = Center.all
          respond_with centers, :except => [:created_at, :updated_at]
      end

      def allow_cross_domain_access
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
        headers['Access-Control-Max-Age'] = '1728000'
      end

    end
  end
end
