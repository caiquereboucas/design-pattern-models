unit InterfaceShipping;

interface

type
  IShipping = interface
    function Calculate(orderValue: Currency): Currency;
  end;

implementation

end.
