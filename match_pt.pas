program MatchPattern;

function matchIdx(var strr, pat: string; idxs, idxp: integer): boolean;
var
	i: integer;
begin
	while true do
	begin
		if idxp > length(pat) then
		begin
			MatchIdx := idxs > length(strr);
			exit
		end;
		if pat[idxp] = '*' then
		begin
			for i := 0 to length(strr) - idxs + 1 do
				if MatchIdx(strr, pat, idxs + i, idxp + 1) then
				begin
					MatchIdx := true;
					exit
				end;
			MatchIdx := false;
			exit
		end;
		if (idxs > length(strr)) or ((strr[idxs] <> pat[idxp]) and (pat[idxp] <> '?')) then
		begin
			MatchIdx := false;
			exit
		end;
		idxs := idxs + 1;
		idxp := idxp + 1
	end
end;

function Match(strr, pat: string): boolean;
begin
	Match := MatchIdx(strr, pat, 1, 1)
end;

begin
	if ParamCount <> 2 then
	begin
		writeln(stderr, 'Two parameters expected');
		halt(1)
	end;
	if Match(ParamStr(1), ParamStr(2)) then
		writeln('yes')
	else
		writeln('no')
end.
