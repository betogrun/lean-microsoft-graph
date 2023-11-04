# frozen_string_literal: true

module LeanMicrosoftGraph
  module Resources
    class UsersResource
      class User
        def initialize(response)
          @response = response
        end

        def id = @response[:id]

        def display_name = @response[:displayName]

        def mail = @response[:mail]

        def user_principal_name = @response[:userPrincipalName]

        def job_title = @response[:jobTitle]

        def mobile_phone = @response[:mobilePhone]

        def business_phones = @response[:businessPhones]

        def given_name = @response[:givenName]

        def surname = @response[:surname]

        def preferred_language = @response[:preferredLanguage]

        def office_location = @response[:officeLocation]

        def to_h
          {
            id: id,
            display_name: display_name,
            mail: mail,
            user_principal_name: user_principal_name,
            job_title: job_title,
            mobile_phone: mobile_phone,
            business_phones: business_phones,
            given_name: given_name,
            surname: surname,
            preferred_language: preferred_language,
            office_location: office_location
          }
        end
      end
    end
  end
end