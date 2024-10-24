unit U2048;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  board : array[0..35] of integer;
  board_label : array[0..35] of Tlabel;
  is_start : boolean = false;

implementation

uses U2048_2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
begin
  if is_start = false then
  begin
    for i := 0 to 35 do
    begin
      randomize();

      form1.Height := 80 + 41 * 6;
      form1.Width := 80 + 41 * 6;

      board_label[i] := Tlabel.Create(self);
      board_label[i].Parent := self;
      board_label[i].Width := 40;
      board_label[i].height := 40;
      board_label[i].Transparent := false;
      board_label[i].AutoSize := false;
      board_label[i].Color := clyellow;
      board_label[i].Font.Size := 16;
      board_label[i].Top := 40 + 41 * (i div 6);
      board_label[i].Left := 40 + 41 * (i mod 6);

      is_start := true;
    end;
    button1.Caption := 'Restart';
  end;

  for i := 0 to 35 do
    board[i] := 0;
  createwall(board,4,4);
  createnumber(board,4,4);
  createnumber(board,4,4);

  for i := 0 to 35 do
  begin
    if board[i] = -1 then
      board_label[i].transparent := true
    else if board[i] = 0 then
      board_label[i].Caption := ''
    else if board[i] >0 then
      board_label[i].Caption := inttostr(board[i]);
  end;

end;

procedure TForm1.Button1KeyPress(Sender: TObject; var Key: Char);
var i : integer;
begin
  if key = 'w' then
    upmove(board,4,4)
  else if key = 'a' then
    leftmove(board,4,4)
  else if key = 's' then
    downmove(board,4,4)
  else if key = 'd' then
    rightmove(board,4,4);

  for i := 0 to 35 do
  begin
    if board[i] = 0 then
      board_label[i].caption := '';
    if board[i] > 0 then
      board_label[i].Caption := inttostr(board[i]);
  end;
end;

end.
