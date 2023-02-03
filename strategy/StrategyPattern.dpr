program StrategyPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ClassOrder in 'ClassOrder.pas',
  InterfaceShipping in 'InterfaceShipping.pas',
  ClassShippingSimple in 'ClassShippingSimple.pas',
  ClassShippingExpress in 'ClassShippingExpress.pas';

type
  TShipping = (shNone = 0, shSimple = 1, shExpress = 2);
var
  order: TOrder;
  shippingSimple: TShippingSimple;
  shippingExpress: TShippingExpress;
  sValue, sShipping: string;
  enumShipping: TShipping;
begin
  order := TOrder.Create;
  try
    try
      Writeln('VIRTUAL MARKET');

      Writeln('Digit the order value: ');
      ReadLn(sValue);

      order.Value := StrToCurrDef(sValue, 0);

      Writeln('Digit the order value: ');
      Writeln('');
      Writeln('Press 1 to Shipping Simple');
      Writeln('Press 2 to Shipping Express');
      ReadLn(sShipping);

      enumShipping := TShipping(StrToIntDef(sShipping, 0));

      case enumShipping of
        shSimple:
        begin
          shippingSimple := TShippingSimple.Create;
          try
            order.SetShipping(shippingSimple);
            Writeln('Shipping Simple: ', FormatFloat('$ ,0.00', order.CalcShipping));
            ReadLn;
          finally
            shippingSimple.Free;
          end;
        end;

        shExpress:
        begin
          shippingExpress := TShippingExpress.Create;
          try
            order.SetShipping(shippingExpress);
            Writeln('Shipping Express: ', FormatFloat('$ ,0.00', order.CalcShipping));
            ReadLn;
          finally
            shippingExpress.Free;
          end;
        end
      else
        Writeln('Invalid option!');
      end;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    order.Free;
  end;
end.
