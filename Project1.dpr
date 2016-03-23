program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  KompasAPI7_TLB in 'KompasAPI7_TLB.pas',
  Kompas6Constants_TLB in 'Kompas6Constants_TLB.pas';

{$R *.res}

begin
  Vcl.Forms.Application.Initialize;
  Vcl.Forms.Application.MainFormOnTaskbar := True;
  Vcl.Forms.Application.CreateForm(TForm1, Form1);
  Vcl.Forms.Application.Run;
end.
