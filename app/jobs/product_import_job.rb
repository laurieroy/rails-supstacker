class ProductImportJob < ApplicationJob
  queue_as :default

  def perform(link, stack_id)
    stack = Stack.find(stack_id)

    existing_product = Product.find_by(link: link)

    if existing_product
      existing_product.stacks << stack
    else
      product = Product.new(link: link)
      product.stacks << stack
      ProductParser::Amazon.save_to_product(link, product)
    end
  end
end
