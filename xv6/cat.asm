
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 31                	jmp    39 <cat+0x39>
    if (write(1, buf, n) != n) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	ff 75 f4             	push   -0xc(%ebp)
   e:	68 80 0b 00 00       	push   $0xb80
  13:	6a 01                	push   $0x1
  15:	e8 88 03 00 00       	call   3a2 <write>
  1a:	83 c4 10             	add    $0x10,%esp
  1d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  20:	74 17                	je     39 <cat+0x39>
      printf(1, "cat: write error\n");
  22:	83 ec 08             	sub    $0x8,%esp
  25:	68 bd 08 00 00       	push   $0x8bd
  2a:	6a 01                	push   $0x1
  2c:	e8 d5 04 00 00       	call   506 <printf>
  31:	83 c4 10             	add    $0x10,%esp
      exit();
  34:	e8 49 03 00 00       	call   382 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  39:	83 ec 04             	sub    $0x4,%esp
  3c:	68 00 02 00 00       	push   $0x200
  41:	68 80 0b 00 00       	push   $0xb80
  46:	ff 75 08             	push   0x8(%ebp)
  49:	e8 4c 03 00 00       	call   39a <read>
  4e:	83 c4 10             	add    $0x10,%esp
  51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  58:	7f ae                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  5e:	79 17                	jns    77 <cat+0x77>
    printf(1, "cat: read error\n");
  60:	83 ec 08             	sub    $0x8,%esp
  63:	68 cf 08 00 00       	push   $0x8cf
  68:	6a 01                	push   $0x1
  6a:	e8 97 04 00 00       	call   506 <printf>
  6f:	83 c4 10             	add    $0x10,%esp
    exit();
  72:	e8 0b 03 00 00       	call   382 <exit>
  }
}
  77:	90                   	nop
  78:	c9                   	leave  
  79:	c3                   	ret    

0000007a <main>:

int
main(int argc, char *argv[])
{
  7a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  7e:	83 e4 f0             	and    $0xfffffff0,%esp
  81:	ff 71 fc             	push   -0x4(%ecx)
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	51                   	push   %ecx
  89:	83 ec 10             	sub    $0x10,%esp
  8c:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
  8e:	83 3b 01             	cmpl   $0x1,(%ebx)
  91:	7f 12                	jg     a5 <main+0x2b>
    cat(0);
  93:	83 ec 0c             	sub    $0xc,%esp
  96:	6a 00                	push   $0x0
  98:	e8 63 ff ff ff       	call   0 <cat>
  9d:	83 c4 10             	add    $0x10,%esp
    exit();
  a0:	e8 dd 02 00 00       	call   382 <exit>
  }

  for(i = 1; i < argc; i++){
  a5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  ac:	eb 71                	jmp    11f <main+0xa5>
    if((fd = open(argv[i], 0)) < 0){
  ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  b1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  b8:	8b 43 04             	mov    0x4(%ebx),%eax
  bb:	01 d0                	add    %edx,%eax
  bd:	8b 00                	mov    (%eax),%eax
  bf:	83 ec 08             	sub    $0x8,%esp
  c2:	6a 00                	push   $0x0
  c4:	50                   	push   %eax
  c5:	e8 f8 02 00 00       	call   3c2 <open>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  d0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  d4:	79 29                	jns    ff <main+0x85>
      printf(1, "cat: cannot open %s\n", argv[i]);
  d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  d9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e0:	8b 43 04             	mov    0x4(%ebx),%eax
  e3:	01 d0                	add    %edx,%eax
  e5:	8b 00                	mov    (%eax),%eax
  e7:	83 ec 04             	sub    $0x4,%esp
  ea:	50                   	push   %eax
  eb:	68 e0 08 00 00       	push   $0x8e0
  f0:	6a 01                	push   $0x1
  f2:	e8 0f 04 00 00       	call   506 <printf>
  f7:	83 c4 10             	add    $0x10,%esp
      exit();
  fa:	e8 83 02 00 00       	call   382 <exit>
    }
    cat(fd);
  ff:	83 ec 0c             	sub    $0xc,%esp
 102:	ff 75 f0             	push   -0x10(%ebp)
 105:	e8 f6 fe ff ff       	call   0 <cat>
 10a:	83 c4 10             	add    $0x10,%esp
    close(fd);
 10d:	83 ec 0c             	sub    $0xc,%esp
 110:	ff 75 f0             	push   -0x10(%ebp)
 113:	e8 92 02 00 00       	call   3aa <close>
 118:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++){
 11b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 11f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 122:	3b 03                	cmp    (%ebx),%eax
 124:	7c 88                	jl     ae <main+0x34>
  }
  exit();
 126:	e8 57 02 00 00       	call   382 <exit>

0000012b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	57                   	push   %edi
 12f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 130:	8b 4d 08             	mov    0x8(%ebp),%ecx
 133:	8b 55 10             	mov    0x10(%ebp),%edx
 136:	8b 45 0c             	mov    0xc(%ebp),%eax
 139:	89 cb                	mov    %ecx,%ebx
 13b:	89 df                	mov    %ebx,%edi
 13d:	89 d1                	mov    %edx,%ecx
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
 142:	89 ca                	mov    %ecx,%edx
 144:	89 fb                	mov    %edi,%ebx
 146:	89 5d 08             	mov    %ebx,0x8(%ebp)
 149:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 14c:	90                   	nop
 14d:	5b                   	pop    %ebx
 14e:	5f                   	pop    %edi
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 15d:	90                   	nop
 15e:	8b 55 0c             	mov    0xc(%ebp),%edx
 161:	8d 42 01             	lea    0x1(%edx),%eax
 164:	89 45 0c             	mov    %eax,0xc(%ebp)
 167:	8b 45 08             	mov    0x8(%ebp),%eax
 16a:	8d 48 01             	lea    0x1(%eax),%ecx
 16d:	89 4d 08             	mov    %ecx,0x8(%ebp)
 170:	0f b6 12             	movzbl (%edx),%edx
 173:	88 10                	mov    %dl,(%eax)
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	75 e2                	jne    15e <strcpy+0xd>
    ;
  return os;
 17c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 17f:	c9                   	leave  
 180:	c3                   	ret    

00000181 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 181:	55                   	push   %ebp
 182:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 184:	eb 08                	jmp    18e <strcmp+0xd>
    p++, q++;
 186:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 18a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
 191:	0f b6 00             	movzbl (%eax),%eax
 194:	84 c0                	test   %al,%al
 196:	74 10                	je     1a8 <strcmp+0x27>
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	0f b6 10             	movzbl (%eax),%edx
 19e:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a1:	0f b6 00             	movzbl (%eax),%eax
 1a4:	38 c2                	cmp    %al,%dl
 1a6:	74 de                	je     186 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1a8:	8b 45 08             	mov    0x8(%ebp),%eax
 1ab:	0f b6 00             	movzbl (%eax),%eax
 1ae:	0f b6 d0             	movzbl %al,%edx
 1b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b4:	0f b6 00             	movzbl (%eax),%eax
 1b7:	0f b6 c8             	movzbl %al,%ecx
 1ba:	89 d0                	mov    %edx,%eax
 1bc:	29 c8                	sub    %ecx,%eax
}
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    

000001c0 <strlen>:

uint
strlen(char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1c6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1cd:	eb 04                	jmp    1d3 <strlen+0x13>
 1cf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
 1d9:	01 d0                	add    %edx,%eax
 1db:	0f b6 00             	movzbl (%eax),%eax
 1de:	84 c0                	test   %al,%al
 1e0:	75 ed                	jne    1cf <strlen+0xf>
    ;
  return n;
 1e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1e5:	c9                   	leave  
 1e6:	c3                   	ret    

000001e7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1ea:	8b 45 10             	mov    0x10(%ebp),%eax
 1ed:	50                   	push   %eax
 1ee:	ff 75 0c             	push   0xc(%ebp)
 1f1:	ff 75 08             	push   0x8(%ebp)
 1f4:	e8 32 ff ff ff       	call   12b <stosb>
 1f9:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <strchr>:

char*
strchr(const char *s, char c)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 04             	sub    $0x4,%esp
 207:	8b 45 0c             	mov    0xc(%ebp),%eax
 20a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 20d:	eb 14                	jmp    223 <strchr+0x22>
    if(*s == c)
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	0f b6 00             	movzbl (%eax),%eax
 215:	38 45 fc             	cmp    %al,-0x4(%ebp)
 218:	75 05                	jne    21f <strchr+0x1e>
      return (char*)s;
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	eb 13                	jmp    232 <strchr+0x31>
  for(; *s; s++)
 21f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	84 c0                	test   %al,%al
 22b:	75 e2                	jne    20f <strchr+0xe>
  return 0;
 22d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 232:	c9                   	leave  
 233:	c3                   	ret    

00000234 <gets>:

char*
gets(char *buf, int max)
{
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 241:	eb 42                	jmp    285 <gets+0x51>
    cc = read(0, &c, 1);
 243:	83 ec 04             	sub    $0x4,%esp
 246:	6a 01                	push   $0x1
 248:	8d 45 ef             	lea    -0x11(%ebp),%eax
 24b:	50                   	push   %eax
 24c:	6a 00                	push   $0x0
 24e:	e8 47 01 00 00       	call   39a <read>
 253:	83 c4 10             	add    $0x10,%esp
 256:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 259:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 25d:	7e 33                	jle    292 <gets+0x5e>
      break;
    buf[i++] = c;
 25f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 f4             	mov    %edx,-0xc(%ebp)
 268:	89 c2                	mov    %eax,%edx
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	01 c2                	add    %eax,%edx
 26f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 273:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 279:	3c 0a                	cmp    $0xa,%al
 27b:	74 16                	je     293 <gets+0x5f>
 27d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 281:	3c 0d                	cmp    $0xd,%al
 283:	74 0e                	je     293 <gets+0x5f>
  for(i=0; i+1 < max; ){
 285:	8b 45 f4             	mov    -0xc(%ebp),%eax
 288:	83 c0 01             	add    $0x1,%eax
 28b:	39 45 0c             	cmp    %eax,0xc(%ebp)
 28e:	7f b3                	jg     243 <gets+0xf>
 290:	eb 01                	jmp    293 <gets+0x5f>
      break;
 292:	90                   	nop
      break;
  }
  buf[i] = '\0';
 293:	8b 55 f4             	mov    -0xc(%ebp),%edx
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	01 d0                	add    %edx,%eax
 29b:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <stat>:

int
stat(char *n, struct stat *st)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	6a 00                	push   $0x0
 2ae:	ff 75 08             	push   0x8(%ebp)
 2b1:	e8 0c 01 00 00       	call   3c2 <open>
 2b6:	83 c4 10             	add    $0x10,%esp
 2b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c0:	79 07                	jns    2c9 <stat+0x26>
    return -1;
 2c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c7:	eb 25                	jmp    2ee <stat+0x4b>
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	push   0xc(%ebp)
 2cf:	ff 75 f4             	push   -0xc(%ebp)
 2d2:	e8 03 01 00 00       	call   3da <fstat>
 2d7:	83 c4 10             	add    $0x10,%esp
 2da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2dd:	83 ec 0c             	sub    $0xc,%esp
 2e0:	ff 75 f4             	push   -0xc(%ebp)
 2e3:	e8 c2 00 00 00       	call   3aa <close>
 2e8:	83 c4 10             	add    $0x10,%esp
  return r;
 2eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2ee:	c9                   	leave  
 2ef:	c3                   	ret    

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2fd:	eb 25                	jmp    324 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
 302:	89 d0                	mov    %edx,%eax
 304:	c1 e0 02             	shl    $0x2,%eax
 307:	01 d0                	add    %edx,%eax
 309:	01 c0                	add    %eax,%eax
 30b:	89 c1                	mov    %eax,%ecx
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
 310:	8d 50 01             	lea    0x1(%eax),%edx
 313:	89 55 08             	mov    %edx,0x8(%ebp)
 316:	0f b6 00             	movzbl (%eax),%eax
 319:	0f be c0             	movsbl %al,%eax
 31c:	01 c8                	add    %ecx,%eax
 31e:	83 e8 30             	sub    $0x30,%eax
 321:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	0f b6 00             	movzbl (%eax),%eax
 32a:	3c 2f                	cmp    $0x2f,%al
 32c:	7e 0a                	jle    338 <atoi+0x48>
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	0f b6 00             	movzbl (%eax),%eax
 334:	3c 39                	cmp    $0x39,%al
 336:	7e c7                	jle    2ff <atoi+0xf>
  return n;
 338:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 349:	8b 45 0c             	mov    0xc(%ebp),%eax
 34c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 34f:	eb 17                	jmp    368 <memmove+0x2b>
    *dst++ = *src++;
 351:	8b 55 f8             	mov    -0x8(%ebp),%edx
 354:	8d 42 01             	lea    0x1(%edx),%eax
 357:	89 45 f8             	mov    %eax,-0x8(%ebp)
 35a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 35d:	8d 48 01             	lea    0x1(%eax),%ecx
 360:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 363:	0f b6 12             	movzbl (%edx),%edx
 366:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 368:	8b 45 10             	mov    0x10(%ebp),%eax
 36b:	8d 50 ff             	lea    -0x1(%eax),%edx
 36e:	89 55 10             	mov    %edx,0x10(%ebp)
 371:	85 c0                	test   %eax,%eax
 373:	7f dc                	jg     351 <memmove+0x14>
  return vdst;
 375:	8b 45 08             	mov    0x8(%ebp),%eax
}
 378:	c9                   	leave  
 379:	c3                   	ret    

0000037a <fork>:
 37a:	b8 01 00 00 00       	mov    $0x1,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <exit>:
 382:	b8 02 00 00 00       	mov    $0x2,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <wait>:
 38a:	b8 03 00 00 00       	mov    $0x3,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <pipe>:
 392:	b8 04 00 00 00       	mov    $0x4,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <read>:
 39a:	b8 05 00 00 00       	mov    $0x5,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <write>:
 3a2:	b8 10 00 00 00       	mov    $0x10,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <close>:
 3aa:	b8 15 00 00 00       	mov    $0x15,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <kill>:
 3b2:	b8 06 00 00 00       	mov    $0x6,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <exec>:
 3ba:	b8 07 00 00 00       	mov    $0x7,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <open>:
 3c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mknod>:
 3ca:	b8 11 00 00 00       	mov    $0x11,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <unlink>:
 3d2:	b8 12 00 00 00       	mov    $0x12,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <fstat>:
 3da:	b8 08 00 00 00       	mov    $0x8,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <link>:
 3e2:	b8 13 00 00 00       	mov    $0x13,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mkdir>:
 3ea:	b8 14 00 00 00       	mov    $0x14,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <chdir>:
 3f2:	b8 09 00 00 00       	mov    $0x9,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <dup>:
 3fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <getpid>:
 402:	b8 0b 00 00 00       	mov    $0xb,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <sbrk>:
 40a:	b8 0c 00 00 00       	mov    $0xc,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <sleep>:
 412:	b8 0d 00 00 00       	mov    $0xd,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <uptime>:
 41a:	b8 0e 00 00 00       	mov    $0xe,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <uthread_init>:
 422:	b8 16 00 00 00       	mov    $0x16,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <thread_num>:
 42a:	b8 17 00 00 00       	mov    $0x17,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <putc>:
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	83 ec 18             	sub    $0x18,%esp
 438:	8b 45 0c             	mov    0xc(%ebp),%eax
 43b:	88 45 f4             	mov    %al,-0xc(%ebp)
 43e:	83 ec 04             	sub    $0x4,%esp
 441:	6a 01                	push   $0x1
 443:	8d 45 f4             	lea    -0xc(%ebp),%eax
 446:	50                   	push   %eax
 447:	ff 75 08             	push   0x8(%ebp)
 44a:	e8 53 ff ff ff       	call   3a2 <write>
 44f:	83 c4 10             	add    $0x10,%esp
 452:	90                   	nop
 453:	c9                   	leave  
 454:	c3                   	ret    

00000455 <printint>:
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	83 ec 28             	sub    $0x28,%esp
 45b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 462:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 466:	74 17                	je     47f <printint+0x2a>
 468:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 46c:	79 11                	jns    47f <printint+0x2a>
 46e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 475:	8b 45 0c             	mov    0xc(%ebp),%eax
 478:	f7 d8                	neg    %eax
 47a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 47d:	eb 06                	jmp    485 <printint+0x30>
 47f:	8b 45 0c             	mov    0xc(%ebp),%eax
 482:	89 45 ec             	mov    %eax,-0x14(%ebp)
 485:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 48c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 48f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 492:	ba 00 00 00 00       	mov    $0x0,%edx
 497:	f7 f1                	div    %ecx
 499:	89 d1                	mov    %edx,%ecx
 49b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49e:	8d 50 01             	lea    0x1(%eax),%edx
 4a1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4a4:	0f b6 91 64 0b 00 00 	movzbl 0xb64(%ecx),%edx
 4ab:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
 4af:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b5:	ba 00 00 00 00       	mov    $0x0,%edx
 4ba:	f7 f1                	div    %ecx
 4bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c3:	75 c7                	jne    48c <printint+0x37>
 4c5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4c9:	74 2d                	je     4f8 <printint+0xa3>
 4cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ce:	8d 50 01             	lea    0x1(%eax),%edx
 4d1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4d4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4d9:	eb 1d                	jmp    4f8 <printint+0xa3>
 4db:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e1:	01 d0                	add    %edx,%eax
 4e3:	0f b6 00             	movzbl (%eax),%eax
 4e6:	0f be c0             	movsbl %al,%eax
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	50                   	push   %eax
 4ed:	ff 75 08             	push   0x8(%ebp)
 4f0:	e8 3d ff ff ff       	call   432 <putc>
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 500:	79 d9                	jns    4db <printint+0x86>
 502:	90                   	nop
 503:	90                   	nop
 504:	c9                   	leave  
 505:	c3                   	ret    

00000506 <printf>:
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
 509:	83 ec 28             	sub    $0x28,%esp
 50c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 513:	8d 45 0c             	lea    0xc(%ebp),%eax
 516:	83 c0 04             	add    $0x4,%eax
 519:	89 45 e8             	mov    %eax,-0x18(%ebp)
 51c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 523:	e9 59 01 00 00       	jmp    681 <printf+0x17b>
 528:	8b 55 0c             	mov    0xc(%ebp),%edx
 52b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 52e:	01 d0                	add    %edx,%eax
 530:	0f b6 00             	movzbl (%eax),%eax
 533:	0f be c0             	movsbl %al,%eax
 536:	25 ff 00 00 00       	and    $0xff,%eax
 53b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 53e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 542:	75 2c                	jne    570 <printf+0x6a>
 544:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 548:	75 0c                	jne    556 <printf+0x50>
 54a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 551:	e9 27 01 00 00       	jmp    67d <printf+0x177>
 556:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	83 ec 08             	sub    $0x8,%esp
 55f:	50                   	push   %eax
 560:	ff 75 08             	push   0x8(%ebp)
 563:	e8 ca fe ff ff       	call   432 <putc>
 568:	83 c4 10             	add    $0x10,%esp
 56b:	e9 0d 01 00 00       	jmp    67d <printf+0x177>
 570:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 574:	0f 85 03 01 00 00    	jne    67d <printf+0x177>
 57a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 57e:	75 1e                	jne    59e <printf+0x98>
 580:	8b 45 e8             	mov    -0x18(%ebp),%eax
 583:	8b 00                	mov    (%eax),%eax
 585:	6a 01                	push   $0x1
 587:	6a 0a                	push   $0xa
 589:	50                   	push   %eax
 58a:	ff 75 08             	push   0x8(%ebp)
 58d:	e8 c3 fe ff ff       	call   455 <printint>
 592:	83 c4 10             	add    $0x10,%esp
 595:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 599:	e9 d8 00 00 00       	jmp    676 <printf+0x170>
 59e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5a2:	74 06                	je     5aa <printf+0xa4>
 5a4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5a8:	75 1e                	jne    5c8 <printf+0xc2>
 5aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ad:	8b 00                	mov    (%eax),%eax
 5af:	6a 00                	push   $0x0
 5b1:	6a 10                	push   $0x10
 5b3:	50                   	push   %eax
 5b4:	ff 75 08             	push   0x8(%ebp)
 5b7:	e8 99 fe ff ff       	call   455 <printint>
 5bc:	83 c4 10             	add    $0x10,%esp
 5bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c3:	e9 ae 00 00 00       	jmp    676 <printf+0x170>
 5c8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5cc:	75 43                	jne    611 <printf+0x10b>
 5ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d1:	8b 00                	mov    (%eax),%eax
 5d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5de:	75 25                	jne    605 <printf+0xff>
 5e0:	c7 45 f4 f5 08 00 00 	movl   $0x8f5,-0xc(%ebp)
 5e7:	eb 1c                	jmp    605 <printf+0xff>
 5e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ec:	0f b6 00             	movzbl (%eax),%eax
 5ef:	0f be c0             	movsbl %al,%eax
 5f2:	83 ec 08             	sub    $0x8,%esp
 5f5:	50                   	push   %eax
 5f6:	ff 75 08             	push   0x8(%ebp)
 5f9:	e8 34 fe ff ff       	call   432 <putc>
 5fe:	83 c4 10             	add    $0x10,%esp
 601:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 605:	8b 45 f4             	mov    -0xc(%ebp),%eax
 608:	0f b6 00             	movzbl (%eax),%eax
 60b:	84 c0                	test   %al,%al
 60d:	75 da                	jne    5e9 <printf+0xe3>
 60f:	eb 65                	jmp    676 <printf+0x170>
 611:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 615:	75 1d                	jne    634 <printf+0x12e>
 617:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61a:	8b 00                	mov    (%eax),%eax
 61c:	0f be c0             	movsbl %al,%eax
 61f:	83 ec 08             	sub    $0x8,%esp
 622:	50                   	push   %eax
 623:	ff 75 08             	push   0x8(%ebp)
 626:	e8 07 fe ff ff       	call   432 <putc>
 62b:	83 c4 10             	add    $0x10,%esp
 62e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 632:	eb 42                	jmp    676 <printf+0x170>
 634:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 638:	75 17                	jne    651 <printf+0x14b>
 63a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63d:	0f be c0             	movsbl %al,%eax
 640:	83 ec 08             	sub    $0x8,%esp
 643:	50                   	push   %eax
 644:	ff 75 08             	push   0x8(%ebp)
 647:	e8 e6 fd ff ff       	call   432 <putc>
 64c:	83 c4 10             	add    $0x10,%esp
 64f:	eb 25                	jmp    676 <printf+0x170>
 651:	83 ec 08             	sub    $0x8,%esp
 654:	6a 25                	push   $0x25
 656:	ff 75 08             	push   0x8(%ebp)
 659:	e8 d4 fd ff ff       	call   432 <putc>
 65e:	83 c4 10             	add    $0x10,%esp
 661:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 664:	0f be c0             	movsbl %al,%eax
 667:	83 ec 08             	sub    $0x8,%esp
 66a:	50                   	push   %eax
 66b:	ff 75 08             	push   0x8(%ebp)
 66e:	e8 bf fd ff ff       	call   432 <putc>
 673:	83 c4 10             	add    $0x10,%esp
 676:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 67d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 681:	8b 55 0c             	mov    0xc(%ebp),%edx
 684:	8b 45 f0             	mov    -0x10(%ebp),%eax
 687:	01 d0                	add    %edx,%eax
 689:	0f b6 00             	movzbl (%eax),%eax
 68c:	84 c0                	test   %al,%al
 68e:	0f 85 94 fe ff ff    	jne    528 <printf+0x22>
 694:	90                   	nop
 695:	90                   	nop
 696:	c9                   	leave  
 697:	c3                   	ret    

00000698 <free>:
 698:	55                   	push   %ebp
 699:	89 e5                	mov    %esp,%ebp
 69b:	83 ec 10             	sub    $0x10,%esp
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	83 e8 08             	sub    $0x8,%eax
 6a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
 6a7:	a1 88 0d 00 00       	mov    0xd88,%eax
 6ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6af:	eb 24                	jmp    6d5 <free+0x3d>
 6b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b4:	8b 00                	mov    (%eax),%eax
 6b6:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 6b9:	72 12                	jb     6cd <free+0x35>
 6bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c1:	77 24                	ja     6e7 <free+0x4f>
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 00                	mov    (%eax),%eax
 6c8:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 6cb:	72 1a                	jb     6e7 <free+0x4f>
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6db:	76 d4                	jbe    6b1 <free+0x19>
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	8b 00                	mov    (%eax),%eax
 6e2:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 6e5:	73 ca                	jae    6b1 <free+0x19>
 6e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ea:	8b 40 04             	mov    0x4(%eax),%eax
 6ed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f7:	01 c2                	add    %eax,%edx
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	39 c2                	cmp    %eax,%edx
 700:	75 24                	jne    726 <free+0x8e>
 702:	8b 45 f8             	mov    -0x8(%ebp),%eax
 705:	8b 50 04             	mov    0x4(%eax),%edx
 708:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70b:	8b 00                	mov    (%eax),%eax
 70d:	8b 40 04             	mov    0x4(%eax),%eax
 710:	01 c2                	add    %eax,%edx
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	89 50 04             	mov    %edx,0x4(%eax)
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	8b 10                	mov    (%eax),%edx
 71f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 722:	89 10                	mov    %edx,(%eax)
 724:	eb 0a                	jmp    730 <free+0x98>
 726:	8b 45 fc             	mov    -0x4(%ebp),%eax
 729:	8b 10                	mov    (%eax),%edx
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	89 10                	mov    %edx,(%eax)
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 40 04             	mov    0x4(%eax),%eax
 736:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 740:	01 d0                	add    %edx,%eax
 742:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 745:	75 20                	jne    767 <free+0xcf>
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	8b 50 04             	mov    0x4(%eax),%edx
 74d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 750:	8b 40 04             	mov    0x4(%eax),%eax
 753:	01 c2                	add    %eax,%edx
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	89 50 04             	mov    %edx,0x4(%eax)
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	8b 10                	mov    (%eax),%edx
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	89 10                	mov    %edx,(%eax)
 765:	eb 08                	jmp    76f <free+0xd7>
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 76d:	89 10                	mov    %edx,(%eax)
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	a3 88 0d 00 00       	mov    %eax,0xd88
 777:	90                   	nop
 778:	c9                   	leave  
 779:	c3                   	ret    

0000077a <morecore>:
 77a:	55                   	push   %ebp
 77b:	89 e5                	mov    %esp,%ebp
 77d:	83 ec 18             	sub    $0x18,%esp
 780:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 787:	77 07                	ja     790 <morecore+0x16>
 789:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	c1 e0 03             	shl    $0x3,%eax
 796:	83 ec 0c             	sub    $0xc,%esp
 799:	50                   	push   %eax
 79a:	e8 6b fc ff ff       	call   40a <sbrk>
 79f:	83 c4 10             	add    $0x10,%esp
 7a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7a5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7a9:	75 07                	jne    7b2 <morecore+0x38>
 7ab:	b8 00 00 00 00       	mov    $0x0,%eax
 7b0:	eb 26                	jmp    7d8 <morecore+0x5e>
 7b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bb:	8b 55 08             	mov    0x8(%ebp),%edx
 7be:	89 50 04             	mov    %edx,0x4(%eax)
 7c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c4:	83 c0 08             	add    $0x8,%eax
 7c7:	83 ec 0c             	sub    $0xc,%esp
 7ca:	50                   	push   %eax
 7cb:	e8 c8 fe ff ff       	call   698 <free>
 7d0:	83 c4 10             	add    $0x10,%esp
 7d3:	a1 88 0d 00 00       	mov    0xd88,%eax
 7d8:	c9                   	leave  
 7d9:	c3                   	ret    

000007da <malloc>:
 7da:	55                   	push   %ebp
 7db:	89 e5                	mov    %esp,%ebp
 7dd:	83 ec 18             	sub    $0x18,%esp
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	83 c0 07             	add    $0x7,%eax
 7e6:	c1 e8 03             	shr    $0x3,%eax
 7e9:	83 c0 01             	add    $0x1,%eax
 7ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7ef:	a1 88 0d 00 00       	mov    0xd88,%eax
 7f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7fb:	75 23                	jne    820 <malloc+0x46>
 7fd:	c7 45 f0 80 0d 00 00 	movl   $0xd80,-0x10(%ebp)
 804:	8b 45 f0             	mov    -0x10(%ebp),%eax
 807:	a3 88 0d 00 00       	mov    %eax,0xd88
 80c:	a1 88 0d 00 00       	mov    0xd88,%eax
 811:	a3 80 0d 00 00       	mov    %eax,0xd80
 816:	c7 05 84 0d 00 00 00 	movl   $0x0,0xd84
 81d:	00 00 00 
 820:	8b 45 f0             	mov    -0x10(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	89 45 f4             	mov    %eax,-0xc(%ebp)
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	8b 40 04             	mov    0x4(%eax),%eax
 82e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 831:	77 4d                	ja     880 <malloc+0xa6>
 833:	8b 45 f4             	mov    -0xc(%ebp),%eax
 836:	8b 40 04             	mov    0x4(%eax),%eax
 839:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 83c:	75 0c                	jne    84a <malloc+0x70>
 83e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 841:	8b 10                	mov    (%eax),%edx
 843:	8b 45 f0             	mov    -0x10(%ebp),%eax
 846:	89 10                	mov    %edx,(%eax)
 848:	eb 26                	jmp    870 <malloc+0x96>
 84a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84d:	8b 40 04             	mov    0x4(%eax),%eax
 850:	2b 45 ec             	sub    -0x14(%ebp),%eax
 853:	89 c2                	mov    %eax,%edx
 855:	8b 45 f4             	mov    -0xc(%ebp),%eax
 858:	89 50 04             	mov    %edx,0x4(%eax)
 85b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85e:	8b 40 04             	mov    0x4(%eax),%eax
 861:	c1 e0 03             	shl    $0x3,%eax
 864:	01 45 f4             	add    %eax,-0xc(%ebp)
 867:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 86d:	89 50 04             	mov    %edx,0x4(%eax)
 870:	8b 45 f0             	mov    -0x10(%ebp),%eax
 873:	a3 88 0d 00 00       	mov    %eax,0xd88
 878:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87b:	83 c0 08             	add    $0x8,%eax
 87e:	eb 3b                	jmp    8bb <malloc+0xe1>
 880:	a1 88 0d 00 00       	mov    0xd88,%eax
 885:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 888:	75 1e                	jne    8a8 <malloc+0xce>
 88a:	83 ec 0c             	sub    $0xc,%esp
 88d:	ff 75 ec             	push   -0x14(%ebp)
 890:	e8 e5 fe ff ff       	call   77a <morecore>
 895:	83 c4 10             	add    $0x10,%esp
 898:	89 45 f4             	mov    %eax,-0xc(%ebp)
 89b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 89f:	75 07                	jne    8a8 <malloc+0xce>
 8a1:	b8 00 00 00 00       	mov    $0x0,%eax
 8a6:	eb 13                	jmp    8bb <malloc+0xe1>
 8a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	8b 00                	mov    (%eax),%eax
 8b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8b6:	e9 6d ff ff ff       	jmp    828 <malloc+0x4e>
 8bb:	c9                   	leave  
 8bc:	c3                   	ret    
