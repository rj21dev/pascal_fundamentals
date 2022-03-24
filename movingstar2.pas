program MovingStar2;
uses crt;
const
	DelayDuration = 100;
type
	star = record
		CurX, CurY, dx, dy: integer;
	end;

procedure ShowStar(var s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write('*');
	GotoXY(1, 1)
end;

procedure HideStar(var s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write(' ');
	GotoXY(1, 1)
end;

procedure MoveStar(var s: star);
begin
	HideStar(s);
	s.CurX := s.CurX + s.dx;
	s.CurY := s.CurY + s.dy;
	ShowStar(s)
end;

procedure SetDirection(var s: star; dx, dy: integer);
begin
	s.dx := dx;
	s.dy := dy
end;

var
	s: star;
	direction, step: integer;
begin
	clrscr;
	s.CurX := 1;
	s.CurY := ScreenHeight div 2;
	direction := 1;
	step := 0;
	s.dx := 1;
	s.dy := 0;
	repeat
		MoveStar(s);
		delay(DelayDuration);
		if (s.CurX = ScreenWidth) or (s.CurX = 1) then
		begin
			direction := -direction;
			SetDirection(s, direction, 0);
			step := step + 1
		end
	until step = 6;
	clrscr
end.
