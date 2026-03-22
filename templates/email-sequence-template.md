# AI Content Factory — Email Sequence Template

> 用途：冷启动订阅用户转化 + 激活沉默订阅者  
> 适用场景：Newsletter 冷启动、Lead Magnet 转化、课程销售预热  
> 标准序列：Welcome Sequence（7–14 天）+ Follow-up Sequence（追加销售）

---

## 📋 序列架构

```
Lead Magnet（引流钩子）
    ↓
Email 1: Welcome + Deliver Promise（立即发送）
Email 2: Social Proof + Value（Day 1 或 +1 天）
Email 3: Story + Authority（Day 2）
Email 4: Soft Pitch + Segmentation（Day 4）
Email 5: Hard CTA（Day 7）
Email 6: Urgency/Last Chance（Day 10）
Email 7: Re-engagement（Day 14，仅对未打开者）
```

---

## 🎯 AI 填充指令（Prompt）

### 生成 Welcome Sequence

```markdown
请为以下 Lead Magnet 生成一个 7 天 email welcome sequence：

Lead Magnet：[YOUR LEAD MAGNET NAME + DESCRIPTION]
目标受众：[AUDIENCE PROBLEM / PAIN POINT]
核心价值主张：[WHAT THEY GET + WHAT IT SOLVES]
产品/服务（如果适用）：[YOUR PAID OFFER]
发送频率：[DAILY / EVERY_OTHER_DAY]

每封邮件要求：
- 主题行：≤40 字符，含数字或好奇心触发词
- 预览文字：≤90 字符
- 正文：≤200 字（欢迎邮件）/ ≤300 字（其他）
- 每封有明确目的（价值交付/故事/信任/销售）
- 结尾 CTA 清晰

邮件序列目标：[CONVERSION / ENGAGEMENT / BRAND_BUILDING]
```

### 生成单个 Follow-up Email

```markdown
请写一封 [EMAIL TYPE] 用于 email sequence：

邮件类型：[WELCOME / VALUE_DELIVERY / SOCIAL_PROOF / STORY / SOFT_PITCH / HARD_PITCH / RE_ENGAGEMENT]
目标受众：[AUDIENCE DESCRIPTION]
当前关系：[NEW_SUBSCRIBER / ENGAGED_SUBSCRIBER / COLD_SUBSCRIBER]
主要信息：[KEY MESSAGE]
次要信息：[SUPPORTING_DETAIL]
期望行动：[DESIRED_ACTION]

格式要求：
- 主题行：[EXACT TEXT]
- 预览文字：[EXACT TEXT]
- 正文结构：Hook → Story/Value → Proof → CTA
- 语气：[CONVERSATIONAL / URGENT / WARM / DIRECT]
- 字数：150–300 字
```

---

## 📝 完整序列示例：Lead Magnet → "AI Productivity Blueprint"

> **Lead Magnet：** "50 AI Prompts for Content Creators（PDF）"  
> **目标受众：** 内容创作者、想让写作效率翻倍的博主  
> **核心价值：** 让读者用 AI 每周多产出 3 篇文章

---

### Email 1：Welcome（立即发送）

```
Subject: 🎯 Your AI prompt library is ready (start here)

Preview: Here's your first prompt + how to use it

---

Hey [FIRST_NAME],

Welcome. You asked for 50 AI prompts — you'll get them.

But first, let me tell you exactly how to use this library so you actually see results.

**The #1 mistake** most people make with AI prompts:
They copy-paste and expect magic. It doesn't work that way.

The right way:
1. Read the prompt (understand why it works)
2. Customize the bracketed [variables] to YOUR situation
3. Run it. Edit the output. Run it again.
4. Repeat until it saves you 30+ minutes

Your first prompt (use it TODAY):

---
"Act as a content strategist. My audience is [DESCRIPTION]. 
I write about [TOPIC]. Give me 10 viral-worthy titles that 
include a number, emotion, and specificity. Rate each 1-10 
for shareability."
---

That's it. 2 minutes. You'll have a week's worth of content ideas.

More prompts in the library. More guidance in the next few emails.

See you tomorrow.

— [YOUR NAME]

P.S. Questions? Just reply to any email. I read every one.
```

---

### Email 2：Value Delivery + Social Proof（Day 1）

```
Subject: The prompt I use every single morning

Preview: My actual 3-step morning AI workflow

---

Hey [FIRST_NAME],

Yesterday I gave you one prompt. Today I want to show you how I actually use AI prompts in my real workflow — not theoretical stuff, this is what I do every morning at 7am.

**My 3-step AI morning routine:**

**Step 1: Content Ideation (2 min)**
→ Run the "viral titles" prompt from yesterday
→ Pick the best 3, save to Notion

**Step 2: Article Outline (5 min)**
→ "Give me a detailed outline for [TITLE], 
   including 3 hooks, 5 main points, 
   and a conclusion with a CTA"

**Step 3: First Draft (15 min)**
→ "Write a 1500-word article based on this outline. 
   Tone: conversational. Audience: [YOUR AUDIENCE]. 
   Include personal stories and examples."

Total time: 22 minutes → What used to take me 3 hours.

---

**Real result from a reader:**

*"I used the article outline prompt and wrote a 2,000-word post in 45 minutes. Before, that same post took me 6 hours."*
— Sarah M., Newsletter Writer (12K subscribers)

---

Your prompt library has 47 more like this. Dip in whenever you need them.

More tomorrow.

— [YOUR NAME]
```

---

### Email 3：Story + Authority（Day 3）

```
Subject: I almost quit writing. Then I found this.

Preview: A real story about burnout and what changed

---

Hey [FIRST_NAME],

February 2024. I hadn't missed a newsletter in 8 months.

I was also burned out, uninspired, and wondering why I ever started.

I was spending 8–10 hours per week on content. It felt like a job I hated but couldn't quit.

Then I started using AI prompts systematically — not for "replacing my voice," but for the parts I hated: ideation, outlines, first-draft structure.

The result after 90 days:
- Content output: 2x
- Time spent: cut by 60%
- Quality (measured by replies): actually went UP

I'm not saying AI writes better than you. It doesn't.

I'm saying AI handles the grunt work so YOUR brain handles the good stuff: insights, stories, connections.

That's what the prompt library is really about — not replacing you. **Augmenting you.**

More soon.

— [YOUR NAME]
```

---

### Email 4：Soft Pitch（Day 5）

```
Subject: A question + something I'm building

Preview: Would you pay $49 to save 5 hours/week?

---

Hey [FIRST_NAME],

Quick question:

If I could show you a system to:
- Generate content ideas in 2 minutes (instead of 2 hours)
- Write full articles in 30 minutes (instead of 6 hours)
- Repurpose one article into 10 social posts

...would you pay $49/month for that?

I'm genuinely asking. I'm building it right now, and I want to know if actual humans want it before I launch.

No sales page. No hype. Just a simple monthly membership:
- 200+ specialized AI prompts (yours + new ones monthly)
- A private community of creators using them
- A weekly walkthrough video

If yes: reply "YES" and I'll send you early access when it's ready.

If no: also reply — I want to know what you're struggling with.

Either way, keep using the free library. It's yours.

— [YOUR NAME]
```

---

### Email 5：Hard CTA（Day 7）

```
Subject: 🔥 Early access opens tomorrow (48 hours only)

Preview: The AI Content System is ready — here's what you get

---

Hey [FIRST_NAME],

**[AI CONTENT SYSTEM]** launches tomorrow.

Here's exactly what you get for $49/month:

**The Prompt Library**
200+ battle-tested prompts organized by workflow:
- Content Ideation (30 prompts)
- Article Writing (45 prompts)
- Social Media (60 prompts)
- Email Newsletters (25 prompts)
- Video Scripts (20 prompts)
- +20 new prompts added monthly

**The Community**
Private Discord of 300+ creators sharing what's working

**The Weekly Workshop**
Every Thursday: live walkthrough of one new workflow

**Early Member Pricing: $49/month (will increase to $99 after launch)**

Link to join → [LANDING PAGE URL]

I'll see you inside.

— [YOUR NAME]

P.S. If $49/month feels steep, the prompt library PDF is $19 standalone. Just reply "solo" and I'll send the link.
```

---

### Email 6：Urgency（Day 10 — 仅发未购买者）

```
Subject: Last chance: $49/month pricing expires tonight

Preview: After this, it goes to $99. No exceptions.

---

Hey [FIRST_NAME],

Just a quick reminder:

**[AI CONTENT SYSTEM]** early access closes tonight at midnight (UTC).

After tonight:
- Monthly price: $49 → $99
- Early member bonus: gone
- No exceptions

If you've been on the fence, now's the time.

👉 [JOIN LINK]

If you have questions, reply to this email. I'm here.

— [YOUR NAME]
```

---

### Email 7：Re-engagement（Day 14 — 仅发未打开者）

```
Subject: Did I lose you? (honest question)

Preview: I noticed you haven't opened my last few emails

---

Hey [FIRST_NAME],

I've sent you a few emails about [PRODUCT NAME] and noticed you haven't opened the last few.

No hard feelings. Things get busy.

Here's the deal: I send 2 emails per week max. One value, one promotion (at most).

If you're not finding value, I totally understand — just reply "unsubscribe" and I'll remove you.

But if you want to stay: my next email will be worth opening. I promise.

What's actually resonating with people right now: **[SPECIFIC VALUE / PROOF]**

Stay or go — either way, thanks for being here.

— [YOUR NAME]
```

---

## 📊 序列指标基准

| 指标 | 行业基准 | 优秀水平 |
|------|----------|----------|
| 欢迎序列打开率 | 40–60% | > 50% |
| 点击率（CTR） | 2–5% | > 8% |
| 转化率（最终 CTA） | 1–3% | > 5% |
| 退订率 | < 0.5% | < 0.2% |

---

## ⚙️ 模板变量说明

| 变量 | 说明 | 示例 |
|------|------|------|
| `[FIRST_NAME]` | 订阅者名字 | "Alex" |
| `[YOUR NAME]` | 发件人名字 | "Qing" |
| `[YOUR AUDIENCE]` | 受众描述 | "Freelance writers" |
| `[YOUR LEAD MAGNET]` | 引流赠品名称 | "50 AI Prompts PDF" |
| `[YOUR PAID OFFER]` | 付费产品名称 | "AI Content System" |
| `[LANDING PAGE URL]` | 落地页链接 | "https://..." |
| `[DESIRED_ACTION]` | 期望行动 | "Reply YES" |

---

## ✅ 发送前检查清单

- [ ] 每封邮件有且只有一个主要 CTA
- [ ] 主题行 ≤ 40 字符
- [ ] 预览文字 ≠ 主题行
- [ ] 邮件长度适合类型（欢迎邮件短，深度邮件长）
- [ ] Personalize `[FIRST_NAME]` 字段
- [ ] 移动端预览测试（>60% 邮件在手机打开）
- [ ] 所有链接已测试（无死链）
- [ ] 退出链接（Unsubscribe）清晰可见

---

*Template by AI Content Factory | 2026-03-22*
