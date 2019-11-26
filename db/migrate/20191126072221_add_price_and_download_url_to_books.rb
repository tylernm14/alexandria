class AddPriceAndDownloadUrlToBooks < ActiveRecord::Migration[5.2]
  def change
    add_monetize  :books, :price
    add_column    :books, :download_ur, :text
  end
end
