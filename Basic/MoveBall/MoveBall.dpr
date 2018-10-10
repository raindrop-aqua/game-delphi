program MoveBall;

uses
  System.StartUpCopy,
  FMX.Forms,
  MoveBallForm in 'MoveBallForm.pas' {frmMoveBall};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMoveBall, frmMoveBall);
  Application.Run;
end.
