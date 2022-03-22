program Strings;

function isalpha(ch: char): boolean;
begin
	isalpha := false;
	if (ch >= 'a') and (ch <= 'z') or (ch >= 'A') and (ch <= 'Z') then
		isalpha := true
end;

function isdigit(ch: char): boolean;
begin
	isdigit := false;
	if (ch >= '0') and (ch <= '9') then
		isdigit := true
end;

function onlydigits(strr: string): boolean;
var
	i: integer;
	notdigit: boolean;
begin
	onlydigits := true;
	notdigit := false;
	for i := 1 to length(strr) do
		if not isdigit(strr[i]) then
			 notdigit := true;
	if notdigit then
		onlydigits := false
end;

function uniqletters(strr: string): boolean;
var
	i, j: integer;
begin
	uniqletters := true;
	for i := 1 to length(strr) - 1 do
		for j := i + 1 to length(strr) do
			if (strr[i] = strr[j]) and isalpha(strr[i]) and isalpha(strr[j]) then
				uniqletters := false
end;

function onlyone(strr: string): boolean;
var
	i: integer;
	diffs: boolean;
begin
	onlyone := true;
	diffs := false;
	if length(strr) > 1 then
		for i := 2 to length(strr) do
			if strr[1] <> strr[i] then
				diffs := true;
	if diffs then
		onlyone := false	
end;

function dogdots(var strr: string): boolean;
var
	i: integer;
	dog, dog2, dot: boolean;
begin
	dog := false;
	dog2 := false;
	dot := false;
	dogdots := false;
	for i := 1 to length(strr) do
	begin
		if (strr[i] = '@') and dog then
			dog2 := true;
		if (strr[i] = '@') then
			dog := true;
		if strr[i] = '.' then
			dot := true
	end;
	if dog and dot and not dog2 then
		dogdots := true;
end;

var
	i, max, maxpos: integer;
	strb: string;
begin
	max := 0;
	maxpos := 0;
	for i := 1 to ParamCount do
		if max < length(ParamStr(i)) then
		begin
			max := length(ParamStr(i));
			maxpos := i
		end;
	writeln(ParamStr(maxpos),' [', max, ']');
	for i := 1 to ParamCount do
	begin
		strb := ParamStr(i);
		if uniqletters(strb) then
			write(strb, ' ')
	end;
	writeln;
	for i := 1 to ParamCount do
	begin
		strb := ParamStr(i);
		if dogdots(strb) then
			write(strb, ' ')
	end;
	writeln;
	for i := 1 to ParamCount do
	begin
		strb := ParamStr(i);
		if onlydigits(strb) then
			write(strb, ' ')
	end;
	writeln;
	for i := 1 to ParamCount do
	begin
		strb := ParamStr(i);
		if onlyone(strb) then
			write(strb, ' ')
	end;
	writeln

end.
