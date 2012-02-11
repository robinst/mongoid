# encoding: utf-8
module Mongoid #:nodoc:
  module Persistence #:nodoc:
    module Atomic #:nodoc:

      # Performs atomic $unset operations.
      class Unset
        include Operation

        # Sends the atomic $unset operation to the database.
        #
        # @example Persist the new values.
        #   unset.persist
        #
        # @return [ nil ] The new value.
        #
        # @since 2.1.0
        def persist
          prepare do
            document.attributes.delete(field)
            collection.find(document.atomic_selector).
              update(operation("$unset"))
            document.remove_change(value)
          end
        end
      end
    end
  end
end
