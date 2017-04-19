namespace :payment  do
  desc "processing a payment"
  task process_payment: :environment do
    puts "miracle ça marche!"
    Credit.payable
  end
end
