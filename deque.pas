program DequeDemo;

type
	LinkedList2 = ^ListNode2;
	ListNode2 = record
		data: longint;
		prev, next: LinkedList2;
	end;
	LongDeque = record
		first, last: LinkedList2;
	end;

procedure LongDequeInit(var deque: LongDeque);
begin
	deque.first := nil;
	deque.last := nil
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
	tmp: LinkedList2;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.prev := nil;
	tmp^.next := deque.first;
	if deque.first = nil then
		deque.last := tmp
	else
		deque.first^.prev := tmp;
	deque.first := tmp
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
var
	tmp: LinkedList2;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.prev := deque.last;
	tmp^.next := nil;
	if deque.last = nil then
		deque.first := tmp
	else
		deque.last^.next := tmp;
	deque.last := tmp
end;

procedure LongDequePopFront(var deque: LongDeque; var n: longint);
var
	tmp: LinkedList2;
begin
	n := deque.first^.data;
	tmp := deque.first;
	deque.first := deque.first^.next;
	if deque.first = nil then
		deque.last := nil
	else
		deque.first^.prev := nil;
	dispose(tmp)
end;

procedure LongDequePopBack(var deque: LongDeque; var n: longint);
var
	tmp: LinkedList2;
begin
	n := deque.last^.data;
	tmp := deque.last;
	deque.last := deque.last^.prev;
	if deque.last = nil then
		deque.first := nil
	else
		deque.last^.next := nil;
	dispose(tmp)
end;

function LongDequeIsEmpty(var deque: LongDeque): boolean;
begin
	LongDequeIsEmpty := deque.first = nil
end;

var
	d: LongDeque;
	n: longint;
begin
	LongDequeInit(d);
	while not SeekEof do
	begin
		read(n);
		LongDequePushFront(d, n)
	end;
	while not SeekEof do
	begin
		read(n);
		LongDequePushBack(d, n)
	end;
	while true do
	begin
		if not LongDequeIsEmpty(d) then
		begin
			LongDequePopFront(d, n);
			writeln(n)
		end
		else
			break;
		if not LongDequeIsEmpty(d) then
		begin
			LongDequePopBack(d, n);
			writeln(n)
		end
		else
			break;
	end
end.

