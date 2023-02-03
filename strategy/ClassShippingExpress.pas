unit ClassShippingExpress;

interface

uses
  InterfaceShipping;

type
  TShippingExpress = class(TInterfacedObject, IShipping)
    function Calculate(orderValue: Currency): Currency;
  end;

implementation

{ TShippingExpress }

function TShippingExpress.Calculate(orderValue: Currency): Currency;
begin
  Result := orderValue * 0.1;
end;

end.
