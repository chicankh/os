
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  20:	eb 69                	jmp    8b <wc+0x8b>
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 58                	jmp    83 <wc+0x83>
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 20 0c 00 00       	add    $0xc20,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 20 0c 00 00       	add    $0xc20,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	83 ec 08             	sub    $0x8,%esp
  53:	50                   	push   %eax
  54:	68 4f 09 00 00       	push   $0x94f
  59:	e8 35 02 00 00       	call   293 <strchr>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	85 c0                	test   %eax,%eax
  63:	74 09                	je     6e <wc+0x6e>
  65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6c:	eb 11                	jmp    7f <wc+0x7f>
  6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  72:	75 0b                	jne    7f <wc+0x7f>
  74:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  78:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  86:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  89:	7c a0                	jl     2b <wc+0x2b>
  8b:	83 ec 04             	sub    $0x4,%esp
  8e:	68 00 02 00 00       	push   $0x200
  93:	68 20 0c 00 00       	push   $0xc20
  98:	ff 75 08             	push   0x8(%ebp)
  9b:	e8 8c 03 00 00       	call   42c <read>
  a0:	83 c4 10             	add    $0x10,%esp
  a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
  b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b4:	79 17                	jns    cd <wc+0xcd>
  b6:	83 ec 08             	sub    $0x8,%esp
  b9:	68 55 09 00 00       	push   $0x955
  be:	6a 01                	push   $0x1
  c0:	e8 d3 04 00 00       	call   598 <printf>
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	e8 47 03 00 00       	call   414 <exit>
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	ff 75 0c             	push   0xc(%ebp)
  d3:	ff 75 e8             	push   -0x18(%ebp)
  d6:	ff 75 ec             	push   -0x14(%ebp)
  d9:	ff 75 f0             	push   -0x10(%ebp)
  dc:	68 65 09 00 00       	push   $0x965
  e1:	6a 01                	push   $0x1
  e3:	e8 b0 04 00 00       	call   598 <printf>
  e8:	83 c4 20             	add    $0x20,%esp
  eb:	90                   	nop
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <main>:
  ee:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  f2:	83 e4 f0             	and    $0xfffffff0,%esp
  f5:	ff 71 fc             	push   -0x4(%ecx)
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	53                   	push   %ebx
  fc:	51                   	push   %ecx
  fd:	83 ec 10             	sub    $0x10,%esp
 100:	89 cb                	mov    %ecx,%ebx
 102:	83 3b 01             	cmpl   $0x1,(%ebx)
 105:	7f 17                	jg     11e <main+0x30>
 107:	83 ec 08             	sub    $0x8,%esp
 10a:	68 72 09 00 00       	push   $0x972
 10f:	6a 00                	push   $0x0
 111:	e8 ea fe ff ff       	call   0 <wc>
 116:	83 c4 10             	add    $0x10,%esp
 119:	e8 f6 02 00 00       	call   414 <exit>
 11e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 125:	e9 83 00 00 00       	jmp    1ad <main+0xbf>
 12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 12d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 134:	8b 43 04             	mov    0x4(%ebx),%eax
 137:	01 d0                	add    %edx,%eax
 139:	8b 00                	mov    (%eax),%eax
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	6a 00                	push   $0x0
 140:	50                   	push   %eax
 141:	e8 0e 03 00 00       	call   454 <open>
 146:	83 c4 10             	add    $0x10,%esp
 149:	89 45 f0             	mov    %eax,-0x10(%ebp)
 14c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 150:	79 29                	jns    17b <main+0x8d>
 152:	8b 45 f4             	mov    -0xc(%ebp),%eax
 155:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 15c:	8b 43 04             	mov    0x4(%ebx),%eax
 15f:	01 d0                	add    %edx,%eax
 161:	8b 00                	mov    (%eax),%eax
 163:	83 ec 04             	sub    $0x4,%esp
 166:	50                   	push   %eax
 167:	68 73 09 00 00       	push   $0x973
 16c:	6a 01                	push   $0x1
 16e:	e8 25 04 00 00       	call   598 <printf>
 173:	83 c4 10             	add    $0x10,%esp
 176:	e8 99 02 00 00       	call   414 <exit>
 17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 185:	8b 43 04             	mov    0x4(%ebx),%eax
 188:	01 d0                	add    %edx,%eax
 18a:	8b 00                	mov    (%eax),%eax
 18c:	83 ec 08             	sub    $0x8,%esp
 18f:	50                   	push   %eax
 190:	ff 75 f0             	push   -0x10(%ebp)
 193:	e8 68 fe ff ff       	call   0 <wc>
 198:	83 c4 10             	add    $0x10,%esp
 19b:	83 ec 0c             	sub    $0xc,%esp
 19e:	ff 75 f0             	push   -0x10(%ebp)
 1a1:	e8 96 02 00 00       	call   43c <close>
 1a6:	83 c4 10             	add    $0x10,%esp
 1a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b0:	3b 03                	cmp    (%ebx),%eax
 1b2:	0f 8c 72 ff ff ff    	jl     12a <main+0x3c>
 1b8:	e8 57 02 00 00       	call   414 <exit>

000001bd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	57                   	push   %edi
 1c1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c5:	8b 55 10             	mov    0x10(%ebp),%edx
 1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cb:	89 cb                	mov    %ecx,%ebx
 1cd:	89 df                	mov    %ebx,%edi
 1cf:	89 d1                	mov    %edx,%ecx
 1d1:	fc                   	cld    
 1d2:	f3 aa                	rep stos %al,%es:(%edi)
 1d4:	89 ca                	mov    %ecx,%edx
 1d6:	89 fb                	mov    %edi,%ebx
 1d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1db:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1de:	90                   	nop
 1df:	5b                   	pop    %ebx
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1ef:	90                   	nop
 1f0:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f3:	8d 42 01             	lea    0x1(%edx),%eax
 1f6:	89 45 0c             	mov    %eax,0xc(%ebp)
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	8d 48 01             	lea    0x1(%eax),%ecx
 1ff:	89 4d 08             	mov    %ecx,0x8(%ebp)
 202:	0f b6 12             	movzbl (%edx),%edx
 205:	88 10                	mov    %dl,(%eax)
 207:	0f b6 00             	movzbl (%eax),%eax
 20a:	84 c0                	test   %al,%al
 20c:	75 e2                	jne    1f0 <strcpy+0xd>
    ;
  return os;
 20e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 211:	c9                   	leave  
 212:	c3                   	ret    

00000213 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 216:	eb 08                	jmp    220 <strcmp+0xd>
    p++, q++;
 218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	0f b6 00             	movzbl (%eax),%eax
 226:	84 c0                	test   %al,%al
 228:	74 10                	je     23a <strcmp+0x27>
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 10             	movzbl (%eax),%edx
 230:	8b 45 0c             	mov    0xc(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	38 c2                	cmp    %al,%dl
 238:	74 de                	je     218 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	0f b6 d0             	movzbl %al,%edx
 243:	8b 45 0c             	mov    0xc(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	0f b6 c8             	movzbl %al,%ecx
 24c:	89 d0                	mov    %edx,%eax
 24e:	29 c8                	sub    %ecx,%eax
}
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25f:	eb 04                	jmp    265 <strlen+0x13>
 261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 265:	8b 55 fc             	mov    -0x4(%ebp),%edx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	01 d0                	add    %edx,%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	84 c0                	test   %al,%al
 272:	75 ed                	jne    261 <strlen+0xf>
    ;
  return n;
 274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <memset>:

void*
memset(void *dst, int c, uint n)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 27c:	8b 45 10             	mov    0x10(%ebp),%eax
 27f:	50                   	push   %eax
 280:	ff 75 0c             	push   0xc(%ebp)
 283:	ff 75 08             	push   0x8(%ebp)
 286:	e8 32 ff ff ff       	call   1bd <stosb>
 28b:	83 c4 0c             	add    $0xc,%esp
  return dst;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 291:	c9                   	leave  
 292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	83 ec 04             	sub    $0x4,%esp
 299:	8b 45 0c             	mov    0xc(%ebp),%eax
 29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	0f b6 00             	movzbl (%eax),%eax
 2a7:	38 45 fc             	cmp    %al,-0x4(%ebp)
 2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	eb 13                	jmp    2c4 <strchr+0x31>
  for(; *s; s++)
 2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	0f b6 00             	movzbl (%eax),%eax
 2bb:	84 c0                	test   %al,%al
 2bd:	75 e2                	jne    2a1 <strchr+0xe>
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d3:	eb 42                	jmp    317 <gets+0x51>
    cc = read(0, &c, 1);
 2d5:	83 ec 04             	sub    $0x4,%esp
 2d8:	6a 01                	push   $0x1
 2da:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2dd:	50                   	push   %eax
 2de:	6a 00                	push   $0x0
 2e0:	e8 47 01 00 00       	call   42c <read>
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ef:	7e 33                	jle    324 <gets+0x5e>
      break;
    buf[i++] = c;
 2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2fa:	89 c2                	mov    %eax,%edx
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	01 c2                	add    %eax,%edx
 301:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 305:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 307:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30b:	3c 0a                	cmp    $0xa,%al
 30d:	74 16                	je     325 <gets+0x5f>
 30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 0e                	je     325 <gets+0x5f>
  for(i=0; i+1 < max; ){
 317:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	39 45 0c             	cmp    %eax,0xc(%ebp)
 320:	7f b3                	jg     2d5 <gets+0xf>
 322:	eb 01                	jmp    325 <gets+0x5f>
      break;
 324:	90                   	nop
      break;
  }
  buf[i] = '\0';
 325:	8b 55 f4             	mov    -0xc(%ebp),%edx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	01 d0                	add    %edx,%eax
 32d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 330:	8b 45 08             	mov    0x8(%ebp),%eax
}
 333:	c9                   	leave  
 334:	c3                   	ret    

00000335 <stat>:

int
stat(char *n, struct stat *st)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33b:	83 ec 08             	sub    $0x8,%esp
 33e:	6a 00                	push   $0x0
 340:	ff 75 08             	push   0x8(%ebp)
 343:	e8 0c 01 00 00       	call   454 <open>
 348:	83 c4 10             	add    $0x10,%esp
 34b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 34e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 352:	79 07                	jns    35b <stat+0x26>
    return -1;
 354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 359:	eb 25                	jmp    380 <stat+0x4b>
  r = fstat(fd, st);
 35b:	83 ec 08             	sub    $0x8,%esp
 35e:	ff 75 0c             	push   0xc(%ebp)
 361:	ff 75 f4             	push   -0xc(%ebp)
 364:	e8 03 01 00 00       	call   46c <fstat>
 369:	83 c4 10             	add    $0x10,%esp
 36c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 36f:	83 ec 0c             	sub    $0xc,%esp
 372:	ff 75 f4             	push   -0xc(%ebp)
 375:	e8 c2 00 00 00       	call   43c <close>
 37a:	83 c4 10             	add    $0x10,%esp
  return r;
 37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 380:	c9                   	leave  
 381:	c3                   	ret    

00000382 <atoi>:

int
atoi(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 38f:	eb 25                	jmp    3b6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 391:	8b 55 fc             	mov    -0x4(%ebp),%edx
 394:	89 d0                	mov    %edx,%eax
 396:	c1 e0 02             	shl    $0x2,%eax
 399:	01 d0                	add    %edx,%eax
 39b:	01 c0                	add    %eax,%eax
 39d:	89 c1                	mov    %eax,%ecx
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	8d 50 01             	lea    0x1(%eax),%edx
 3a5:	89 55 08             	mov    %edx,0x8(%ebp)
 3a8:	0f b6 00             	movzbl (%eax),%eax
 3ab:	0f be c0             	movsbl %al,%eax
 3ae:	01 c8                	add    %ecx,%eax
 3b0:	83 e8 30             	sub    $0x30,%eax
 3b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 00             	movzbl (%eax),%eax
 3bc:	3c 2f                	cmp    $0x2f,%al
 3be:	7e 0a                	jle    3ca <atoi+0x48>
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	0f b6 00             	movzbl (%eax),%eax
 3c6:	3c 39                	cmp    $0x39,%al
 3c8:	7e c7                	jle    391 <atoi+0xf>
  return n;
 3ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3cd:	c9                   	leave  
 3ce:	c3                   	ret    

000003cf <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
 3d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e1:	eb 17                	jmp    3fa <memmove+0x2b>
    *dst++ = *src++;
 3e3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3e6:	8d 42 01             	lea    0x1(%edx),%eax
 3e9:	89 45 f8             	mov    %eax,-0x8(%ebp)
 3ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ef:	8d 48 01             	lea    0x1(%eax),%ecx
 3f2:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 3f5:	0f b6 12             	movzbl (%edx),%edx
 3f8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 3fa:	8b 45 10             	mov    0x10(%ebp),%eax
 3fd:	8d 50 ff             	lea    -0x1(%eax),%edx
 400:	89 55 10             	mov    %edx,0x10(%ebp)
 403:	85 c0                	test   %eax,%eax
 405:	7f dc                	jg     3e3 <memmove+0x14>
  return vdst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <fork>:
 40c:	b8 01 00 00 00       	mov    $0x1,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <exit>:
 414:	b8 02 00 00 00       	mov    $0x2,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <wait>:
 41c:	b8 03 00 00 00       	mov    $0x3,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <pipe>:
 424:	b8 04 00 00 00       	mov    $0x4,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <read>:
 42c:	b8 05 00 00 00       	mov    $0x5,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <write>:
 434:	b8 10 00 00 00       	mov    $0x10,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <close>:
 43c:	b8 15 00 00 00       	mov    $0x15,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <kill>:
 444:	b8 06 00 00 00       	mov    $0x6,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exec>:
 44c:	b8 07 00 00 00       	mov    $0x7,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <open>:
 454:	b8 0f 00 00 00       	mov    $0xf,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <mknod>:
 45c:	b8 11 00 00 00       	mov    $0x11,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <unlink>:
 464:	b8 12 00 00 00       	mov    $0x12,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <fstat>:
 46c:	b8 08 00 00 00       	mov    $0x8,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <link>:
 474:	b8 13 00 00 00       	mov    $0x13,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mkdir>:
 47c:	b8 14 00 00 00       	mov    $0x14,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <chdir>:
 484:	b8 09 00 00 00       	mov    $0x9,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <dup>:
 48c:	b8 0a 00 00 00       	mov    $0xa,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <getpid>:
 494:	b8 0b 00 00 00       	mov    $0xb,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <sbrk>:
 49c:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sleep>:
 4a4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <uptime>:
 4ac:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <uthread_init>:
 4b4:	b8 16 00 00 00       	mov    $0x16,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <thread_num>:
 4bc:	b8 17 00 00 00       	mov    $0x17,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <putc>:
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	83 ec 18             	sub    $0x18,%esp
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	88 45 f4             	mov    %al,-0xc(%ebp)
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4d8:	50                   	push   %eax
 4d9:	ff 75 08             	push   0x8(%ebp)
 4dc:	e8 53 ff ff ff       	call   434 <write>
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	90                   	nop
 4e5:	c9                   	leave  
 4e6:	c3                   	ret    

000004e7 <printint>:
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	83 ec 28             	sub    $0x28,%esp
 4ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4f4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4f8:	74 17                	je     511 <printint+0x2a>
 4fa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4fe:	79 11                	jns    511 <printint+0x2a>
 500:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 507:	8b 45 0c             	mov    0xc(%ebp),%eax
 50a:	f7 d8                	neg    %eax
 50c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 50f:	eb 06                	jmp    517 <printint+0x30>
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 45 ec             	mov    %eax,-0x14(%ebp)
 517:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 51e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 521:	8b 45 ec             	mov    -0x14(%ebp),%eax
 524:	ba 00 00 00 00       	mov    $0x0,%edx
 529:	f7 f1                	div    %ecx
 52b:	89 d1                	mov    %edx,%ecx
 52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 530:	8d 50 01             	lea    0x1(%eax),%edx
 533:	89 55 f4             	mov    %edx,-0xc(%ebp)
 536:	0f b6 91 f8 0b 00 00 	movzbl 0xbf8(%ecx),%edx
 53d:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
 541:	8b 4d 10             	mov    0x10(%ebp),%ecx
 544:	8b 45 ec             	mov    -0x14(%ebp),%eax
 547:	ba 00 00 00 00       	mov    $0x0,%edx
 54c:	f7 f1                	div    %ecx
 54e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 551:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 555:	75 c7                	jne    51e <printint+0x37>
 557:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 55b:	74 2d                	je     58a <printint+0xa3>
 55d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 560:	8d 50 01             	lea    0x1(%eax),%edx
 563:	89 55 f4             	mov    %edx,-0xc(%ebp)
 566:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 56b:	eb 1d                	jmp    58a <printint+0xa3>
 56d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 570:	8b 45 f4             	mov    -0xc(%ebp),%eax
 573:	01 d0                	add    %edx,%eax
 575:	0f b6 00             	movzbl (%eax),%eax
 578:	0f be c0             	movsbl %al,%eax
 57b:	83 ec 08             	sub    $0x8,%esp
 57e:	50                   	push   %eax
 57f:	ff 75 08             	push   0x8(%ebp)
 582:	e8 3d ff ff ff       	call   4c4 <putc>
 587:	83 c4 10             	add    $0x10,%esp
 58a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 58e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 592:	79 d9                	jns    56d <printint+0x86>
 594:	90                   	nop
 595:	90                   	nop
 596:	c9                   	leave  
 597:	c3                   	ret    

00000598 <printf>:
 598:	55                   	push   %ebp
 599:	89 e5                	mov    %esp,%ebp
 59b:	83 ec 28             	sub    $0x28,%esp
 59e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5a5:	8d 45 0c             	lea    0xc(%ebp),%eax
 5a8:	83 c0 04             	add    $0x4,%eax
 5ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
 5ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5b5:	e9 59 01 00 00       	jmp    713 <printf+0x17b>
 5ba:	8b 55 0c             	mov    0xc(%ebp),%edx
 5bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c0:	01 d0                	add    %edx,%eax
 5c2:	0f b6 00             	movzbl (%eax),%eax
 5c5:	0f be c0             	movsbl %al,%eax
 5c8:	25 ff 00 00 00       	and    $0xff,%eax
 5cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d4:	75 2c                	jne    602 <printf+0x6a>
 5d6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5da:	75 0c                	jne    5e8 <printf+0x50>
 5dc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5e3:	e9 27 01 00 00       	jmp    70f <printf+0x177>
 5e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5eb:	0f be c0             	movsbl %al,%eax
 5ee:	83 ec 08             	sub    $0x8,%esp
 5f1:	50                   	push   %eax
 5f2:	ff 75 08             	push   0x8(%ebp)
 5f5:	e8 ca fe ff ff       	call   4c4 <putc>
 5fa:	83 c4 10             	add    $0x10,%esp
 5fd:	e9 0d 01 00 00       	jmp    70f <printf+0x177>
 602:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 606:	0f 85 03 01 00 00    	jne    70f <printf+0x177>
 60c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 610:	75 1e                	jne    630 <printf+0x98>
 612:	8b 45 e8             	mov    -0x18(%ebp),%eax
 615:	8b 00                	mov    (%eax),%eax
 617:	6a 01                	push   $0x1
 619:	6a 0a                	push   $0xa
 61b:	50                   	push   %eax
 61c:	ff 75 08             	push   0x8(%ebp)
 61f:	e8 c3 fe ff ff       	call   4e7 <printint>
 624:	83 c4 10             	add    $0x10,%esp
 627:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 62b:	e9 d8 00 00 00       	jmp    708 <printf+0x170>
 630:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 634:	74 06                	je     63c <printf+0xa4>
 636:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 63a:	75 1e                	jne    65a <printf+0xc2>
 63c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63f:	8b 00                	mov    (%eax),%eax
 641:	6a 00                	push   $0x0
 643:	6a 10                	push   $0x10
 645:	50                   	push   %eax
 646:	ff 75 08             	push   0x8(%ebp)
 649:	e8 99 fe ff ff       	call   4e7 <printint>
 64e:	83 c4 10             	add    $0x10,%esp
 651:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 655:	e9 ae 00 00 00       	jmp    708 <printf+0x170>
 65a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 65e:	75 43                	jne    6a3 <printf+0x10b>
 660:	8b 45 e8             	mov    -0x18(%ebp),%eax
 663:	8b 00                	mov    (%eax),%eax
 665:	89 45 f4             	mov    %eax,-0xc(%ebp)
 668:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 670:	75 25                	jne    697 <printf+0xff>
 672:	c7 45 f4 87 09 00 00 	movl   $0x987,-0xc(%ebp)
 679:	eb 1c                	jmp    697 <printf+0xff>
 67b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67e:	0f b6 00             	movzbl (%eax),%eax
 681:	0f be c0             	movsbl %al,%eax
 684:	83 ec 08             	sub    $0x8,%esp
 687:	50                   	push   %eax
 688:	ff 75 08             	push   0x8(%ebp)
 68b:	e8 34 fe ff ff       	call   4c4 <putc>
 690:	83 c4 10             	add    $0x10,%esp
 693:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 697:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69a:	0f b6 00             	movzbl (%eax),%eax
 69d:	84 c0                	test   %al,%al
 69f:	75 da                	jne    67b <printf+0xe3>
 6a1:	eb 65                	jmp    708 <printf+0x170>
 6a3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a7:	75 1d                	jne    6c6 <printf+0x12e>
 6a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	0f be c0             	movsbl %al,%eax
 6b1:	83 ec 08             	sub    $0x8,%esp
 6b4:	50                   	push   %eax
 6b5:	ff 75 08             	push   0x8(%ebp)
 6b8:	e8 07 fe ff ff       	call   4c4 <putc>
 6bd:	83 c4 10             	add    $0x10,%esp
 6c0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c4:	eb 42                	jmp    708 <printf+0x170>
 6c6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ca:	75 17                	jne    6e3 <printf+0x14b>
 6cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cf:	0f be c0             	movsbl %al,%eax
 6d2:	83 ec 08             	sub    $0x8,%esp
 6d5:	50                   	push   %eax
 6d6:	ff 75 08             	push   0x8(%ebp)
 6d9:	e8 e6 fd ff ff       	call   4c4 <putc>
 6de:	83 c4 10             	add    $0x10,%esp
 6e1:	eb 25                	jmp    708 <printf+0x170>
 6e3:	83 ec 08             	sub    $0x8,%esp
 6e6:	6a 25                	push   $0x25
 6e8:	ff 75 08             	push   0x8(%ebp)
 6eb:	e8 d4 fd ff ff       	call   4c4 <putc>
 6f0:	83 c4 10             	add    $0x10,%esp
 6f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f6:	0f be c0             	movsbl %al,%eax
 6f9:	83 ec 08             	sub    $0x8,%esp
 6fc:	50                   	push   %eax
 6fd:	ff 75 08             	push   0x8(%ebp)
 700:	e8 bf fd ff ff       	call   4c4 <putc>
 705:	83 c4 10             	add    $0x10,%esp
 708:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 70f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 713:	8b 55 0c             	mov    0xc(%ebp),%edx
 716:	8b 45 f0             	mov    -0x10(%ebp),%eax
 719:	01 d0                	add    %edx,%eax
 71b:	0f b6 00             	movzbl (%eax),%eax
 71e:	84 c0                	test   %al,%al
 720:	0f 85 94 fe ff ff    	jne    5ba <printf+0x22>
 726:	90                   	nop
 727:	90                   	nop
 728:	c9                   	leave  
 729:	c3                   	ret    

0000072a <free>:
 72a:	55                   	push   %ebp
 72b:	89 e5                	mov    %esp,%ebp
 72d:	83 ec 10             	sub    $0x10,%esp
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	83 e8 08             	sub    $0x8,%eax
 736:	89 45 f8             	mov    %eax,-0x8(%ebp)
 739:	a1 28 0e 00 00       	mov    0xe28,%eax
 73e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 741:	eb 24                	jmp    767 <free+0x3d>
 743:	8b 45 fc             	mov    -0x4(%ebp),%eax
 746:	8b 00                	mov    (%eax),%eax
 748:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 74b:	72 12                	jb     75f <free+0x35>
 74d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 750:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 753:	77 24                	ja     779 <free+0x4f>
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 75d:	72 1a                	jb     779 <free+0x4f>
 75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 762:	8b 00                	mov    (%eax),%eax
 764:	89 45 fc             	mov    %eax,-0x4(%ebp)
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76d:	76 d4                	jbe    743 <free+0x19>
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 00                	mov    (%eax),%eax
 774:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 777:	73 ca                	jae    743 <free+0x19>
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	8b 40 04             	mov    0x4(%eax),%eax
 77f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 786:	8b 45 f8             	mov    -0x8(%ebp),%eax
 789:	01 c2                	add    %eax,%edx
 78b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78e:	8b 00                	mov    (%eax),%eax
 790:	39 c2                	cmp    %eax,%edx
 792:	75 24                	jne    7b8 <free+0x8e>
 794:	8b 45 f8             	mov    -0x8(%ebp),%eax
 797:	8b 50 04             	mov    0x4(%eax),%edx
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	8b 40 04             	mov    0x4(%eax),%eax
 7a2:	01 c2                	add    %eax,%edx
 7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a7:	89 50 04             	mov    %edx,0x4(%eax)
 7aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ad:	8b 00                	mov    (%eax),%eax
 7af:	8b 10                	mov    (%eax),%edx
 7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b4:	89 10                	mov    %edx,(%eax)
 7b6:	eb 0a                	jmp    7c2 <free+0x98>
 7b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c0:	89 10                	mov    %edx,(%eax)
 7c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c5:	8b 40 04             	mov    0x4(%eax),%eax
 7c8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	01 d0                	add    %edx,%eax
 7d4:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 7d7:	75 20                	jne    7f9 <free+0xcf>
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 50 04             	mov    0x4(%eax),%edx
 7df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	01 c2                	add    %eax,%edx
 7e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ea:	89 50 04             	mov    %edx,0x4(%eax)
 7ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f0:	8b 10                	mov    (%eax),%edx
 7f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f5:	89 10                	mov    %edx,(%eax)
 7f7:	eb 08                	jmp    801 <free+0xd7>
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7ff:	89 10                	mov    %edx,(%eax)
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	a3 28 0e 00 00       	mov    %eax,0xe28
 809:	90                   	nop
 80a:	c9                   	leave  
 80b:	c3                   	ret    

0000080c <morecore>:
 80c:	55                   	push   %ebp
 80d:	89 e5                	mov    %esp,%ebp
 80f:	83 ec 18             	sub    $0x18,%esp
 812:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 819:	77 07                	ja     822 <morecore+0x16>
 81b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	c1 e0 03             	shl    $0x3,%eax
 828:	83 ec 0c             	sub    $0xc,%esp
 82b:	50                   	push   %eax
 82c:	e8 6b fc ff ff       	call   49c <sbrk>
 831:	83 c4 10             	add    $0x10,%esp
 834:	89 45 f4             	mov    %eax,-0xc(%ebp)
 837:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 83b:	75 07                	jne    844 <morecore+0x38>
 83d:	b8 00 00 00 00       	mov    $0x0,%eax
 842:	eb 26                	jmp    86a <morecore+0x5e>
 844:	8b 45 f4             	mov    -0xc(%ebp),%eax
 847:	89 45 f0             	mov    %eax,-0x10(%ebp)
 84a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84d:	8b 55 08             	mov    0x8(%ebp),%edx
 850:	89 50 04             	mov    %edx,0x4(%eax)
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	83 c0 08             	add    $0x8,%eax
 859:	83 ec 0c             	sub    $0xc,%esp
 85c:	50                   	push   %eax
 85d:	e8 c8 fe ff ff       	call   72a <free>
 862:	83 c4 10             	add    $0x10,%esp
 865:	a1 28 0e 00 00       	mov    0xe28,%eax
 86a:	c9                   	leave  
 86b:	c3                   	ret    

0000086c <malloc>:
 86c:	55                   	push   %ebp
 86d:	89 e5                	mov    %esp,%ebp
 86f:	83 ec 18             	sub    $0x18,%esp
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	83 c0 07             	add    $0x7,%eax
 878:	c1 e8 03             	shr    $0x3,%eax
 87b:	83 c0 01             	add    $0x1,%eax
 87e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 881:	a1 28 0e 00 00       	mov    0xe28,%eax
 886:	89 45 f0             	mov    %eax,-0x10(%ebp)
 889:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 88d:	75 23                	jne    8b2 <malloc+0x46>
 88f:	c7 45 f0 20 0e 00 00 	movl   $0xe20,-0x10(%ebp)
 896:	8b 45 f0             	mov    -0x10(%ebp),%eax
 899:	a3 28 0e 00 00       	mov    %eax,0xe28
 89e:	a1 28 0e 00 00       	mov    0xe28,%eax
 8a3:	a3 20 0e 00 00       	mov    %eax,0xe20
 8a8:	c7 05 24 0e 00 00 00 	movl   $0x0,0xe24
 8af:	00 00 00 
 8b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b5:	8b 00                	mov    (%eax),%eax
 8b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bd:	8b 40 04             	mov    0x4(%eax),%eax
 8c0:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8c3:	77 4d                	ja     912 <malloc+0xa6>
 8c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c8:	8b 40 04             	mov    0x4(%eax),%eax
 8cb:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8ce:	75 0c                	jne    8dc <malloc+0x70>
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	8b 10                	mov    (%eax),%edx
 8d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d8:	89 10                	mov    %edx,(%eax)
 8da:	eb 26                	jmp    902 <malloc+0x96>
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e5:	89 c2                	mov    %eax,%edx
 8e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ea:	89 50 04             	mov    %edx,0x4(%eax)
 8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f0:	8b 40 04             	mov    0x4(%eax),%eax
 8f3:	c1 e0 03             	shl    $0x3,%eax
 8f6:	01 45 f4             	add    %eax,-0xc(%ebp)
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ff:	89 50 04             	mov    %edx,0x4(%eax)
 902:	8b 45 f0             	mov    -0x10(%ebp),%eax
 905:	a3 28 0e 00 00       	mov    %eax,0xe28
 90a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90d:	83 c0 08             	add    $0x8,%eax
 910:	eb 3b                	jmp    94d <malloc+0xe1>
 912:	a1 28 0e 00 00       	mov    0xe28,%eax
 917:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91a:	75 1e                	jne    93a <malloc+0xce>
 91c:	83 ec 0c             	sub    $0xc,%esp
 91f:	ff 75 ec             	push   -0x14(%ebp)
 922:	e8 e5 fe ff ff       	call   80c <morecore>
 927:	83 c4 10             	add    $0x10,%esp
 92a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 92d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 931:	75 07                	jne    93a <malloc+0xce>
 933:	b8 00 00 00 00       	mov    $0x0,%eax
 938:	eb 13                	jmp    94d <malloc+0xe1>
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 940:	8b 45 f4             	mov    -0xc(%ebp),%eax
 943:	8b 00                	mov    (%eax),%eax
 945:	89 45 f4             	mov    %eax,-0xc(%ebp)
 948:	e9 6d ff ff ff       	jmp    8ba <malloc+0x4e>
 94d:	c9                   	leave  
 94e:	c3                   	ret    
