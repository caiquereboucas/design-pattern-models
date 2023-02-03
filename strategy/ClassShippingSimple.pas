unit ClassShippingSimple;

interface

uses
  InterfaceShipping;

type
  TShippingSimple = class(TInterfacedObject, IShipping)
    function Calculate(orderValue: Currency): Currency;
  end;

implementation

{ TShippingSimple }

function TShippingSimple.Calculate(orderValue: Currency): Currency;
begin
  Result := orderValue * 0.05;
end;

end.
