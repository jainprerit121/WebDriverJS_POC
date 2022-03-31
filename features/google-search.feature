const {Given, When, Then} = require('cucumber');
const { Builder } = require('selenium-webdriver');
const driver = new Builder().forBrowser('chrome').build();
const {AfterAll} = require('cucumber');
const { async } = require('regenerator-runtime');
const { assert } = require('console');

AfterAll('end', async function (){
    await driver.quit();
});


Given('I am on the Google homepage', async function () {
    await driver.get('https://www.google.com/');
  });
  
  When('I search for {string}', async function (string) {
    const element = await driver.findElement(By.name('q'));
    element.sendKeys(string, Key.RETURN);
    await driver.sleep(1000);
  });
  
  Then('the page title is {string}', async function (string) {
    assert.equal(await driver.getTitle(), string);
  });
