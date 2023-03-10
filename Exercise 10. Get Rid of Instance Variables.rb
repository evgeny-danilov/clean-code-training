# frozen_string_literal: true

module JWT
  module JWK
    class KeyFinder
      def initialize(options)
        jwks_or_loader = options[:jwks]
        @jwks          = jwks_or_loader if jwks_or_loader.is_a?(Hash)
        @jwk_loader    = jwks_or_loader if jwks_or_loader.respond_to?(:call)
      end

      def key_for(kid)
        raise ::JWT::DecodeError, 'No key id (kid) found from token headers' unless kid

        jwk = resolve_key(kid)

        raise ::JWT::DecodeError, "Could not find public key for kid #{kid}" unless jwk

        ::JWT::JWK.import(jwk).keypair
      end

      private

      def resolve_key(kid)
        jwk = find_key(kid, jwks)
        # NOTE: it's always better to pass variables directly in the method, instead of relying on randomly mutable instance variables inside

        return jwk if jwk

        return find_key(kid, load_keys(invalidate: true)) if reloadable?

        nil
      end

      def jwks
        @jwks ||= load_keys
        # NOTE: as for now, we use instance variable only for memoization, and don't use it in other places
      end

      def load_keys(opts = {})
        @jwk_loader.call(opts)
      end

      def find_key(kid, jwks)
        Array(jwks[:keys]).find { |key| key[:kid] == kid }
      end

      def reloadable?
        @jwk_loader
      end
    end
  end
end
