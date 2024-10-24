program P2048;

uses
  Vcl.Forms,
  U2048 in 'U2048.pas' {Form1},
  U2048_2 in 'U2048_2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
