// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(RESET)
	@temp
	M = 0

(IN)

	D = M[24576]

	@DEL //�Է� ������ del
	D;JEQ

	@temp
	D = M
	@8192 //�Ѿ�� ����
	D=D-A 
	@IN
	D;JEQ


(DRAW)

	@temp
	D = M //temp �� �ҷ���

	@SCREEN
	A = A+D //screen + temp
	M = -1 // ��ĥ��

	@temp // �׷��� ���� ī��Ʈ ����
	M = M+1 // ī��Ʈ ����

	@IN // IN���� ����
	0;JMP


(DEL)
	
	@temp
	D = M

	@IN
	D;JLT // temp�� 0�̸� �ǳʲ�

	
	@temp
	D = M

	@SCREEN
	A = A+D //screen + temp
	M = 0 // ����

	@temp // �׷��� ���� ī��Ʈ ����
	M = M-1 // ī��Ʈ ����

	@IN // IN���� ����
	0;JMP