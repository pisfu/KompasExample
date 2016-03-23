unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, KompasAPI7_TLB, Kompas6Constants_TLB,
  COMObj, StdCtrls, jpeg, ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    EditD: TEdit;
    EditD1: TEdit;
    EditL: TEdit;
    EditL1: TEdit;
    EditL2: TEdit;
    EditL3: TEdit;
    EditD2: TEdit;
    EditD4: TEdit;
    EditL4: TEdit;
    EditL5: TEdit;
    EditL6: TEdit;
    EditL7: TEdit;
    EditL8: TEdit;
    EditM: TEdit;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  D, D1, L, L1, L2, L3, D2, D4, L4, L5, L6, L7, L8, M: extended;
function AddLine(LSS: ILineSegments; X1, Y1, X2, Y2: extended): ILineSegment;
procedure Kompas(B, L0, a, bH, b6, ba, c, h, dw1, dw2, dw3, dw4: extended);

implementation

{$R *.dfm}

function AddLine(LSS: ILineSegments; X1, Y1, X2, Y2: extended): ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSNormal;
  LS.Update;
  Result := LS;
end;

function AddLine2(LSS: ILineSegments; X1, Y1, X2, Y2: extended): ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSAxial;
  LS.Update;
  Result := LS;
end;

function AddLineAxial(LSS: ILineSegments; X1, Y1, X2, Y2: extended)
  : ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSThin;
  LS.Update;
  Result := LS;
end;

function AddLineAxial2(LSS: ILineSegments; X1, Y1, X2, Y2: extended)
  : ILineSegment;
var
  LS: ILineSegment;
begin
  LS := LSS.Add;
  LS.X1 := X1;
  LS.Y1 := Y1;
  LS.X2 := X2;
  LS.Y2 := Y2;
  LS.Style := ksCSAxial;
  LS.Update;
  Result := LS;
end;

function AddArc(Arcs: IArcs; Xc, Yc, R: extended): IArc;
var
  Arc: IArc;
begin
  Arc := Arcs.Add;
  Arc.Xc := Xc;
  Arc.Yc := Yc;
  Arc.Radius := R;
  Arc.Angle1 := 0;
  Arc.Angle2 := 360;
  Arc.Style := ksCSNormal;
  Arc.Update;
  Result := Arc;
end;

function AddArc1(Arcs: IArcs; Xc, Yc, R: extended): IArc;
var
  Arc: IArc;
begin
  Arc := Arcs.Add;
  Arc.Xc := Xc;
  Arc.Yc := Yc;
  Arc.Radius := R;
  Arc.Angle1 := 0;
  Arc.Angle2 := 360;
  Arc.Style := ksCSAxial;
  Arc.Update;
  Result := Arc;
end;

// function AddLine3(LSS: ILineDimensions; X1, Y1, X2, Y2, X3, Y3: extended)
// : ILineDimension;
// var
// LS2: ILineDimension;
//
// begin
//
// LS2 := LSS.Add;
// LS2.X1 := X1;
// LS2.Y1 := Y1;
// LS2.X2 := X2;
// LS2.Y2 := Y2;
// LS2.X3 := X3;
// LS2.Y3 := Y3;
// Ls2.
// LS2.Update;
// Result := LS2;
// end;

function AddLine1(LSS: ILineDimensions; X1, Y1, X2, Y2, X3, Y3: extended)
  : ILineDimension;
var
  LS2: ILineDimension;

begin

  LS2 := LSS.Add;
  LS2.X1 := X1;
  LS2.Y1 := Y1;
  LS2.X2 := X2;
  LS2.Y2 := Y2;
  LS2.X3 := X3;
  LS2.Y3 := Y3;
  LS2.Update;
  Result := LS2;
end;

function AddArcAxial(Arcs: IArcs; X1, Y1, X2, Y2, X3, Y3: extended): IArc;
var
  Arc: IArc;
begin
  Arc := Arcs.Add;
  Arc.X1 := X1;
  Arc.Y1 := Y1;
  Arc.X2 := X2;
  Arc.Y2 := Y2;
  Arc.X3 := X3;
  Arc.Y3 := Y3;
  Arc.Style := ksCSNormal;
  Arc.Update;
  Result := Arc;
end;

function Addarv(LSS: IDiametralDimensions; X1, Y1, X2: extended)
  : IDiametralDimension;
var
  LS2: IDiametralDimension;
begin
  LS2 := LSS.Add;
  LS2.Xc := X1;
  LS2.Yc := Y1;
  LS2.DimensionType := False;
  LS2.Radius := X2;
  LS2.Angle := 80;
  LS2.Update;
  Result := LS2;
end;

procedure Kompas(B, L0, a, bH, b6, ba, c, h, dw1, dw2, dw3, dw4: extended);
var
  j, G, x0, y0, Y2, X2, X3, Y3, Ab, Bc, X1, Y1, De, Fg,D5: extended;
  KP: IApplication;
  KD: IKompasDocument;
  DP: IDispatch;
  LSS: ILineSegments;
  Arcs: IArcs;
  AW: IView;
  es: ICircles;
  Fd: IDiametralDimensions;
  Fd2: IRadialDimensions;
  Skk: ILineDimensions;
  dimText: IDimensionText;
  dimParam: IDimensionParams;
  LineSeg: array [0 .. 45] of ILineSegment;
  LineSeg2: array [0 .. 20] of ILineDimension;
  ArcSeg: array [0 .. 20] of IArc;
  Fds: array [0 .. 20] of IDiametralDimension;
  branchs: IBranchs;
  baseLeader: IBaseLeader;
  leader: Ileader;
  txtOnSh: IText;
  symbCont: ISymbols2DContainer;
  leadersCol: ILeaders;
  lead: Ileader;
  bLeader: IBaseLeader;
begin
  D5 := (D1 - D) / 2;
  Ab := (L1 - L6) / 2;
  Bc := (L2 - L4) / 2;
  De := (L2 - L5) / 2;
  Fg := L - L8;
  G := 100;
  x0 := 150;
  y0 := 150;
  X1 := 150 - D / 2;
  Y1 := 400;
  j := 6;
  KP := Co_Application.Create;
  KP.Visible := true;
  KD := KP.Documents.Add(1, true);
  KD := KP.ActiveDocument;
  KD.LayoutSheets.Item[0].Format.Format := ksFormatUser;
  KD.LayoutSheets.Item[0].Format.FormatWidth := 300;
  KD.LayoutSheets.Item[0].Format.FormatHeight := 500;
  KD.LayoutSheets.Item[0].Update;

  AW := (KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView;
  LSS := ((KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView as
    IDrawingContainer).LineSegments;
  Skk := (AW as ISymbols2DContainer).LineDimensions;
  Fd := (AW as ISymbols2DContainer).DiametralDimensions;
  Arcs := ((KD as IDrawingDocument).ViewsAndLayersManager.Views.ActiveView as
    IDrawingContainer).Arcs;
  ArcSeg[1] := AddArc(Arcs, x0, y0, D1 / 2);
  ArcSeg[2] := AddArc(Arcs, x0, y0, D / 2); // окружность
  ArcSeg[3] := AddArc1(Arcs, x0, y0, D5);
  ArcSeg[4] := AddArc(Arcs, x0 - D5, y0, M / 2);
  ArcSeg[5] := AddArc(Arcs, x0 + D5, y0, M / 2);
  ArcSeg[6] := AddArc(Arcs, x0, y0 - D5, M / 2);
  ArcSeg[7] := AddArc(Arcs, x0, y0 + D5, M / 2);
  LineSeg[1] := AddLine2(LSS, x0, y0 - L1 / 2 - 5, x0, y0 + L1 / 2 + 5);
  LineSeg[2] := AddLine2(LSS, x0 - L1 / 2 - 5, y0, x0 + L1 / 2 + 5, y0);
  LineSeg[3] := AddLine(LSS, x0 - L2 / 2, y0 + L1 / 2, x0 - L2 / 2 + L2,
    y0 + L1 / 2);
  LineSeg[4] := AddLine(LSS, x0 - L2 / 2, y0 - L1 / 2, x0 - L2 / 2 + L2,
    y0 - L1 / 2);
  LineSeg[5] := AddLine(LSS, x0 - L2 / 2 + L2, y0 + L1 / 2, x0 - L2 / 2 + L2,
    y0 + L1 / 2 - Ab);
  LineSeg[6] := AddLine(LSS, x0 - L2 / 2 + L2, y0 + L1 / 2 - Ab,
    x0 - L2 / 2 + L2 - Bc, y0 + L1 / 2 - Ab);
  LineSeg[7] := AddLine(LSS, x0 - L2 / 2 + L2 - Bc, y0 + L1 / 2 - Ab,
    x0 - L2 / 2 + L2 - Bc, y0 + L1 / 2 - Ab - L6);
  LineSeg[14] := AddLine(LSS, x0 - L2 / 2 + L2 - Bc, y0 + L1 / 2 - Ab - L6,
    x0 - L2 / 2 + L2 - Bc + Bc, y0 + L1 / 2 - Ab - L6);
  LineSeg[8] := AddLine(LSS, x0 - L2 / 2 + L2 - Bc + Bc, y0 + L1 / 2 - Ab - L6,
    x0 - L2 / 2 + L2 - Bc + Bc, y0 + L1 / 2 - Ab - L6 - Ab);
  LineSeg[9] := AddLine(LSS, x0 - L2 / 2, y0 + L1 / 2, x0 - L2 / 2,
    y0 + L1 / 2 - Ab);
  LineSeg[10] := AddLine(LSS, x0 - L2 / 2, y0 + L1 / 2 - Ab, x0 - L2 / 2 + Bc,
    y0 + L1 / 2 - Ab);
  LineSeg[11] := AddLine(LSS, x0 - L2 / 2 + Bc, y0 + L1 / 2 - Ab,
    x0 - L2 / 2 + Bc, y0 + L1 / 2 - Ab - L6);
  LineSeg[12] := AddLine(LSS, x0 - L2 / 2 + Bc, y0 + L1 / 2 - Ab - L6,
    x0 - L2 / 2 + Bc - Bc, y0 + L1 / 2 - Ab - L6);
  LineSeg[13] := AddLine(LSS, x0 - L2 / 2 + Bc - Bc, y0 + L1 / 2 - Ab - L6,
    x0 - L2 / 2 + Bc - Bc, y0 + L1 / 2 - Ab - L6 - Ab);

  ArcSeg[8] := AddArc(Arcs, x0 - L5 / 2, y0 - L7 / 2, D4 / 2);
  LineSeg[15] := AddLine2(LSS, x0 - L5 / 2, y0 - L7 / 2 - 5, x0 - L5 / 2,
    y0 - L7 / 2 + 5);
  LineSeg[16] := AddLine2(LSS, x0 - L5 / 2 - 5, y0 - L7 / 2, x0 - L5 / 2 + 5,
    y0 - L7 / 2);
  ArcSeg[9] := AddArc(Arcs, x0 - L5 / 2, y0 + L7 / 2, D4 / 2);
  LineSeg[17] := AddLine2(LSS, x0 - L5 / 2, y0 + L7 / 2 - 5, x0 - L5 / 2,
    y0 + L7 / 2 + 5);
  LineSeg[18] := AddLine2(LSS, x0 - L5 / 2 - 5, y0 + L7 / 2, x0 - L5 / 2 + 5,
    y0 + L7 / 2);
  ArcSeg[8] := AddArc(Arcs, x0 + L5 / 2, y0 + L7 / 2, D4 / 2);
  LineSeg[19] := AddLine2(LSS, x0 + L5 / 2, y0 + L7 / 2 - 5, x0 + L5 / 2,
    y0 + L7 / 2 + 5);
  LineSeg[20] := AddLine2(LSS, x0 + L5 / 2 - 5, y0 + L7 / 2, x0 + L5 / 2 + 5,
    y0 + L7 / 2);
  ArcSeg[8] := AddArc(Arcs, x0 + L5 / 2, y0 - L7 / 2, D4 / 2);
  LineSeg[15] := AddLine2(LSS, x0 + L5 / 2, y0 - L7 / 2 - 5, x0 + L5 / 2,
    y0 - L7 / 2 + 5);
  LineSeg[16] := AddLine2(LSS, x0 + L5 / 2 - 5, y0 - L7 / 2, x0 + L5 / 2 + 5,
    y0 - L7 / 2);

  LineSeg[17] := AddLine(LSS, X1, Y1, X1 + D1 - 5, Y1);
  LineSeg[18] := AddLine(LSS, X1, Y1, X1 - 2.5, Y1 - 2.5);
  LineSeg[19] := AddLine(LSS, X1 - 2.5, Y1 - 2.5, X1 - 2.5 + D1 / 2, Y1 - 2.5);
  LineSeg[20] := AddLine(LSS, X1 - 2.5, Y1 - 2.5, X1 - 2.5, Y1 - (L - L3));
  LineSeg[21] := AddLine(LSS, X1 - 2.5 - Bc, Y1 - (L - L3),
    X1 - 2.5 - Bc + D1 / 2 + Bc, Y1 - (L - L3));
  LineSeg[22] := AddLine(LSS, X1 - 2.5 - Bc, Y1 - (L - L3), X1 - 2.5 - Bc,
    Y1 - (L - L3) - L3);
  LineSeg[23] := AddLine(LSS, X1 - 2.5 - Bc, Y1 - (L - L3) - L3,
    X1 - 2.5 - Bc + L2, Y1 - (L - L3) - L3);
  LineSeg[24] := AddLine2(LSS, X1 + D1 / 2 - 2.5, Y1 + 2, X1 + D1 / 2 - 2.5,
    Y1 - L - 2);
  LineSeg[25] := AddLine(LSS, X1 - 2.5 - Bc + De - De / 2, Y1 - (L - L3),
    X1 - 2.5 - Bc + De - De / 2, Y1 - (L - L3) - L3);
  LineSeg[26] := AddLine2(LSS, X1 - 2.5 - Bc + De, Y1 - (L - L3) + 2,
    X1 - 2.5 - Bc + De, Y1 - (L - L3) - L3 - 2);
  LineSeg[27] := AddLine(LSS, X1 - 2.5 - Bc + De + De / 2, Y1 - (L - L3),
    X1 - 2.5 - Bc + De + De / 2, Y1 - (L - L3) - L3);
  LineSeg[28] := AddLine(LSS, X1 + D1 / 2 + D / 2 - 2.5, Y1,
    X1 + D1 / 2 + D / 2 - 2.5, Y1 - Fg);
  LineSeg[31] := AddLine(LSS, X1 + D1 - 5, Y1, X1 + D1 - 5 + 2.5, Y1 - 2.5);
  LineSeg[32] := AddLine(LSS, X1 + D1 - 5 + 2.5, Y1 - 2.5, X1 + D1 - 5 + 2.5,
    Y1 - 2.5 - (L - L3));
  LineSeg[33] := AddLine(LSS, X1 + D1 - 5 + 2.5, Y1 - 2.5 - (L - L3),
    X1 + D1 - 5 + 2.5 + Bc + (L4 - D1), Y1 - 2.5 - (L - L3));
  LineSeg[29] := AddLine(LSS, X1 + D1 / 2 - 2.5, Y1 - (L - L8),
    X1 + D1 / 2 - 2.5 + D2 / 2, Y1 - (L - L8));
  LineSeg[30] := AddLine(LSS, X1 + D1 / 2 - 2.5 + D2 / 2, Y1 - (L - L8),
    X1 + D1 / 2 - 2.5 + D2 / 2, Y1 - (L - L8) - L8);
  LineSeg[34] := AddLine(LSS, X1 + D1 - 5 + 2.5 + Bc + (L4 - D1),
    Y1 - 2.5 - (L - L3), X1 + D1 - 5 + 2.5 + Bc + (L4 - D1),
    Y1 - (L - L3) - L3);
  LineSeg[35] := AddLine(LSS, X1 + L4 - 2.5, Y1 - 2.5 - (L - L3), X1 + L4 - 2.5,
    Y1 - (L - L3) - L3);
  LineSeg[36] := AddLine2(LSS, X1 + L4 - 2.5 + De, Y1 - (L - L3) + 0.5,
    X1 + L4 - 2.5 + De, Y1 - (L - L3) - L3 - 2);
  LineSeg[37] := AddLine(LSS, X1 + D1 - 5, Y1, X1 + D1 - 5 - 2, Y1 - 2);
  LineSeg[38] := AddLine(LSS, X1 + D1 - 5 - 2, Y1 - 2, X1 + D1 - 5 - 2,
    Y1 - 2 - (L - L8) + 2);
  LineSeg[39] := AddLine(LSS, X1 + D1 - 5 - 2, Y1 - 2,
    X1 + D1 - 5 - 2 - M, Y1 - 2);
  LineSeg[40] := AddLine(LSS, X1 + D1 - 5 - 2 - M, Y1 - 2,
    X1 + D1 - 5 - 2 - M - 2, Y1 - 2 + 2);
  LineSeg[41] := AddLine(LSS, X1 + D1 - 5 - 2 - M, Y1 - 2, X1 + D1 - 5 - 2 - M,
    Y1 - 2 - (L - L8) + 2);
  LineSeg[41] := AddLine2(LSS, X1 + D1 - 5 - 2 - M / 2, Y1 + 2,
    X1 + D1 - 5 - 2 - M / 2, Y1 - 2 - (L - L8));

  LineSeg2[1] := AddLine1(Skk, x0 - L4 / 2, y0, x0 + L4 / 2, y0, x0,
    y0 - L1 / 2 - 10);
  LineSeg2[2] := AddLine1(Skk, x0 - L5 / 2, y0 - ((L1 - L7) / 2), x0 + L5 / 2,
    y0 - ((L1 - L7) / 2), x0, y0 - L1 / 2 - 20);
  LineSeg2[3] := AddLine1(Skk, x0 - L2 / 2, y0 - L1 / 2, x0 + L2 / 2,
    y0 - L1 / 2, x0, y0 - L1 / 2 - 30);
  LineSeg2[4] := AddLine1(Skk, x0 + L2 / 2, y0 + L6 / 2, x0 + L2 / 2,
    y0 - L6 / 2, x0 + L2 / 2 + 10, y0);
  LineSeg2[5] := AddLine1(Skk, x0 + L5 / 2, y0 + L7 / 2, x0 + L5 / 2,
    y0 - L7 / 2, x0 + L2 / 2 + 20, y0);
  LineSeg2[6] := AddLine1(Skk, x0 + L2 / 2, y0 + L1 / 2, x0 + L2 / 2,
    y0 - L1 / 2, x0 + L2 / 2 + 30, y0);
  LineSeg2[7] := AddLine1(Skk, X1 - Bc, Y1 - (L - L3), X1 - Bc,
    Y1 - (L - L3) - L3, X1 - Bc - 10, Y1 - (L - L3));
  LineSeg2[8] := AddLine1(Skk, X1, Y1, X1, Y1 - L, X1 - 20, Y1 - L);
  LineSeg2[9] := AddLine1(Skk, X1, Y1, X1, Y1 - 2.5, X1 - 10, Y1);
  LineSeg2[10] := AddLine1(Skk, X1 + D1 - 5, Y1, X1 + D1 - 5, Y1 - 2.5,
    X1 + D1 - 5 + 10, Y1);
  LineSeg2[11] := AddLine1(Skk, X1 + D1 / 2 - 2.5 + D2 / 2, Y1 - (L - L8),
    X1 + D1 / 2 - 2.5 + D2 / 2, Y1 - (L - L8) - L8, X1 + D1 / 2 - 2.5 + D2 / 2 +
    L2 / 2, Y1 - (L - L8));

  dimText := LineSeg2[9] as IDimensionText; // текст рядом с размером
  dimText.Suffix.Str := 'x45&01';
  LineSeg2[9].Update;
  dimText := LineSeg2[10] as IDimensionText; // текст рядом с размером
  dimText.Suffix.Str := 'x45&01';
  LineSeg2[10].Update;

  LineSeg2[12] := AddLine1(Skk, X1 + (D1 / 2 - D / 2) - 2.5, Y1,
    X1 + D1 / 2 + D / 2 - 2.5, Y1, X1 + D1 / 2 + D / 2 - 2.5, Y1 + 10);
  dimParam := LineSeg2[12] as IDimensionParams; // текст с одной стрелочкой
  dimParam.RemoteLine1 := False;
  dimParam.ArrowType1 := ksLeaderWithoutArrow;
  LineSeg2[12].Update;
  LineSeg2[13] := AddLine1(Skk, X1 - 2.5, Y1 - 2.5, X1 + D1 - 2.5, Y1-2.5,
    X1 + D1 - 2.5, Y1 + 20);
  dimParam := LineSeg2[13] as IDimensionParams; // текст с одной стрелочкой
  dimParam.RemoteLine1 := False;
  dimParam.ArrowType1 := ksLeaderWithoutArrow;
  LineSeg2[13].Update;

  symbCont := (KD as IKompasDocument2D).ViewsAndLayersManager.Views.ActiveView
    As ISymbols2DContainer;
  leadersCol := symbCont.Leaders;
  leader := leadersCol.Add(ksDrLeader) As Ileader;
  // CreateLeader(leader);
  if (leader <> nil) then
  begin
    // Направление полки - вправо
    leader.ShelfDirection := ksLSLeft;

    // Получаем интерфейс ответвлений
    branchs := leader As IBranchs;

    if (branchs <> nil) then
    begin
      // Координаты начала полки или точка привязки
      branchs.x0 := x0 - L5 / 5;
      branchs.y0 := y0 + L1 / 2 + 10;
      // Добавить прямолинейные ответвления
      branchs.AddBranchByPoint(-1, x0 - M / 2, y0 + L7 / 2 + 2);
      // branchs.AddBranchByPoint(-1, x0 - L4 / 2 + 20, y0 - L7 / 2 + 10);
    end;

    // Получить интерфейс текста над полкой
    txtOnSh := leader.TextOnShelf;

    if (txtOnSh <> nil) then
      // Изменить текст
      txtOnSh.Str := '4 отв. M' + FloatToStr(M);

    baseLeader := leader As IBaseLeader;

    if (baseLeader <> nil) then
      // Применить параметры
      baseLeader.Update();
    leader := leadersCol.Add(ksDrLeader) As Ileader;
    // CreateLeader(leader);
    if (leader <> nil) then
    begin
      // Направление полки - вправо
      leader.ShelfDirection := ksLSLeft;

      // Получаем интерфейс ответвлений
      branchs := leader As IBranchs;

      if (branchs <> nil) then
      begin
        // Координаты начала полки или точка привязки
        branchs.x0 := x0 - L2 / 2 - 10;
        branchs.y0 := y0 - L7 / 2 - 5;
        // Добавить прямолинейные ответвления

        branchs.AddBranchByPoint(-1, x0 - L5 / 2 - D4 / 2,
          y0 - L7 / 2 - D4 / 2);
      end;

      // Получить интерфейс текста над полкой
      txtOnSh := leader.TextOnShelf;

      if (txtOnSh <> nil) then
        // Изменить текст
        txtOnSh.Str := '4 отв. M' + FloatToStr(D4);

      baseLeader := leader As IBaseLeader;

      if (baseLeader <> nil) then
        // Применить параметры
        baseLeader.Update();
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  D := StrToInt(EditD.Text);
  D1 := StrToInt(EditD1.Text);
  D2 := StrToInt(EditD2.Text);
  D4 := StrToInt(EditD4.Text);
  L := StrToInt(EditL.Text);
  L1 := StrToInt(EditL1.Text);
  L2 := StrToInt(EditL2.Text);
  L3 := StrToInt(EditL3.Text);
  L4 := StrToInt(EditL4.Text);
  L5 := StrToInt(EditL5.Text);
  L6 := StrToInt(EditL6.Text);
  L7 := StrToInt(EditL7.Text);
  L8 := StrToInt(EditL8.Text);
  M := StrToInt(EditM.Text);
  Kompas(65, 30, 20, 5.5, 5.5, 60, 8, 20, 55, 6, 12, 13);
end;

End.
