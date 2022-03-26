program QOL;

type
	LinkedList = ^ListNode;
	ListNode = record
		data: longint;
		next: LinkedList;
	end;
	QueueOfLongint = record
		first, last: LinkedList;
	end;

procedure QOLInit(var queue: QueueOfLongint);
begin
	queue.first := nil;
	queue.last := nil
end;

procedure QOLPut(var queue: QueueOfLongint; n: longint);
begin
	if queue.first = nil then
	begin
		new(queue.first);
		queue.last := queue.first
	end
	else
	begin
		new(queue.last^.next);
		queue.last := queue.last^.next
	end;
	queue.last^.data := n;
	queue.last^.next := nil
end;

procedure QOLGet(var queue: QueueOfLongint; var n: longint);
var
	tmp: LinkedList;
begin
	n := queue.first^.data;
	tmp := queue.first;
	queue.first := queue.first^.next;
	if queue.first = nil then
		queue.last := nil;
	dispose(tmp)
end;

function QOLIsEmpty(var queue: QueueOfLongint): boolean;
begin
	QOLIsEmpty := queue.first = nil
end;

var
	q: QueueOfLongint;
	n: longint;
begin
	QOLInit(q);
	while not SeekEof do
	begin
		read(n);
		QOLPut(q, n)
	end;
	while not QOLIsEmpty(q) do
	begin
		QOLGet(q, n);
		writeln(n)
	end
end.
