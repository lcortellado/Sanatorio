class DellePedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :insumo
end
