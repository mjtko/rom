require 'inflecto'
require 'rom/relation_registry/relation_builder'

module ROM
  class RelationRegistry

    class DSL
      attr_reader :schema, :relations

      def initialize(schema)
        @schema = schema
        @relations = RelationRegistry.new
      end

      def register(name, &block)
        builder = RelationBuilder.new(name, schema)
        relation = builder.call(&block)

        relations << relation
      end

      def call
        relations
      end

    end

  end
end
