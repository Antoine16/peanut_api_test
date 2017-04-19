module LoansHelper
  def set_roi(loan)
    if loan.roi == 0.03
      "Sécurité"
    elsif loan.roi == 0.06
      "Tranquilité"
    elsif loan.roi == 0.09
      "Dynamique"
    end
  end
end
