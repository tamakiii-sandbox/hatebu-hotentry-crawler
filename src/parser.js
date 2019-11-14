const puppeteer = require('puppeteer');

const input = require('fs').readFileSync('/dev/stdin', 'utf8');
const args = process.argv.slice(2);

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto(args[0]); // TODO
  await page.setContent(input);

  const main = await page.evaluate(() => {
    const section = document.querySelector("#container > div.wrapper > div > div.entrylist-main > section > div > ul > li > div > div.entrylist-contents-main")

    return {
      title: {
        text: section.querySelector('h3.entrylist-contents-title').innerText,
        link: section.querySelector('h3.entrylist-contents-title a').href,
      },
      category: {
        text: section.querySelector('div.entrylist-contents-detail ul.entrylist-contents-meta li.entrylist-contents-category').innerText,
        link: section.querySelector('div.entrylist-contents-detail ul.entrylist-contents-meta li.entrylist-contents-category a').href,
      },
      tags: Array.from(section.querySelectorAll("ul.entrylist-contents-tags li a")).map((a) => (
        {
          text: a.innerText,
          link: a.href,
        }
      ))
    }
  })

  const another = await page.evaluate(() => {
    const contents = document.querySelectorAll("#container > div.wrapper > div > div.entrylist-main > section > ul > li > div.entrylist-contents");

    return Array.from(contents).map((section) => (
      {
        title: {
          text: section.querySelector('h3.entrylist-contents-title').innerText,
          link: section.querySelector('h3.entrylist-contents-title a').href,
        },
        category: {
          text: section.querySelector('div.entrylist-contents-detail ul.entrylist-contents-meta li.entrylist-contents-category').innerText,
          link: section.querySelector('div.entrylist-contents-detail ul.entrylist-contents-meta li.entrylist-contents-category a').href,
        },
        tags: Array.from(section.querySelectorAll("ul.entrylist-contents-tags li a")).map((a) => (
          {
            text: a.innerText,
            link: a.href,
          }
        ))
      }
    ));
  });

  console.log(JSON.stringify({main, another}));

  await browser.close();
})();
