program PowersDemo;

procedure powers(x: real; var square, cube, fourth, fifth: real);
begin
	square := x * x;
	cube := square * x;
	fourth := cube * x;
	fifth := fourth * x
end;

var
	num, p2, p3, p4, p5: real;
begin
	write('Enter the number: ');
	readln(num);
	powers(num, p2, p3, p4, p5);
	writeln(num:3:2, '^2 = ', p2:3:2);
	writeln(num:3:2, '^3 = ', p3:3:2);
	writeln(num:3:2, '^4 = ', p4:3:2);
	writeln(num:3:2, '^5 = ', p5:3:2);
end.
