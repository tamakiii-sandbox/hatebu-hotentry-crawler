const fs = require('fs');
const args = process.argv.slice(2);

fs.readFile(args[0], (err, data) => {
  if (err) {
    throw err; 
  }
  const json = JSON.parse(data.toString());

  const result = json.entries.map((row) => (
    [
      `- [${row.title.text}](${row.title.link}) \`${row.category.text}\` \`${row.users.count} USERS\``,
      `  - ${row.tags.map((tag) => (tag.text))}`
    ].join("\n")
  ));

  console.log(result.join("\n"));
});

