unit ClassOrder;

interface

uses
  InterfaceShipping;

type
  TOrder = class
  private
    FValue: Currency;
    FShipping: IShipping;
    procedure SetValue(const Value: Currency);
  public
    property Value: Currency read FValue write SetValue;
    procedure SetShipping(Shipping: IShipping);
    function CalcShipping(): Currency;
  end;

implementation

uses
  SysUtils;

{ TOrder }

function TOrder.CalcShipping: Currency;
begin
  Result := FShipping.Calculate(FValue);
end;

procedure TOrder.SetShipping(Shipping: IShipping);
begin
  FShipping := Shipping;
end;

procedure TOrder.SetValue(const Value: Currency);
begin
  if Value > 0 then
    FValue := Value
  else
    raise Exception.Create('Invalid value!');
end;

end.
