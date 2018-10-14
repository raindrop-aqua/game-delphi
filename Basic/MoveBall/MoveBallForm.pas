unit MoveBallForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TfrmMoveBall = class(TForm)
    Timer1: TTimer;
    Circle1: TCircle;
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private 宣言 }
    vx, vy: Single; // 動きの量
    xMax, xMin: Single; // ボールが動く範囲（X軸）
    yMax, yMin: Single; // ボールが動く範囲（Y軸）
  public
    { public 宣言 }
  end;

var
  frmMoveBall: TfrmMoveBall;

implementation

{$R *.fmx}

procedure TfrmMoveBall.FormCreate(Sender: TObject);
begin
  vx := 10;
  vy := 10;
end;

procedure TfrmMoveBall.FormResize(Sender: TObject);
begin
  // ウィンドウサイズが変わったときに
  // ボールが動く範囲をアップデートする
  xMin := 0;
  yMin := 0;
  xMax := frmMoveBall.ClientWidth - Circle1.Width;
  yMax := frmMoveBall.ClientHeight - Circle1.Width;
end;

procedure TfrmMoveBall.Timer1Timer(Sender: TObject);
var
  newX, newY: Single;
begin
  // ボールの位置を算出
  newX := Circle1.Position.X + vx;
  newY := Circle1.Position.Y + vy;

  // ボールの位置を更新
  Circle1.Position.X := newX;
  Circle1.Position.Y := newY;

  // 壁にぶつかったときにボールの移動方向を変更する
  if (newX <= xMin) then
  begin
    vx := abs(vx);
  end;
  if (xMax < newX) then
  begin
    vx := abs(vx) * -1;
  end;

  if (newY <= yMin) then
  begin
    vy := abs(vy);
  end;
  if (yMax < newY) then
  begin
    vy := abs(vy) * -1;
  end;

end;

end.
