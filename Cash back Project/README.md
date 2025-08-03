# Introduction
- Add your project logo.
- Write a short introduction to the project.
- If you are using badges, add them here.

## Index

- [About](#about)
- [Usage](#usage)
  - [Installation](#installation)
  - [Commands](#commands)
- [Development](#development)
  - [Pre-Requisites](#pre-requisites)
  - [Developmen Environment](#development-environment)
  - [File Structure](#file-structure)
  - [Build](#build)  
  - [Deployment](#deployment)  
- [Community](#community)
  - [Contribution](#contribution)
  - [Branches](#branches)
  - [Guideline](guideline)  
- [FAQ](#faq)
- [Resources](#resources)
- [Gallery](#gallery)
- [Credit/Acknowledgment](#creditacknowledgment)
- [License](#license)

## Tổng quan về Project
Dự án dự trên yêu cầu xử lý dữ liệu khách hàng cho Chương trình:  "Hoàn tiền (Cashback) cho các khách hàng sử dụng thẻ ảo - Virtual credict card (VCC) 
### Thể lệ của chương trình hoàn tiền:
- Chỉ tiêu xét hoàn tiền: Là Tổng số tiền chi tiêu đã được quy đổi về USD trong một kỳ sao kê (Kỳ sao kê: Tính được từ ngày đầu tiên đến ngày cuối cùng của tháng). Chỉ tiêu xét hoàn tiền phải đạt giá trị nhỏ nhất được hoàn tiền (có tỷ lệ hoàn tiền > 0)
- Tỷ lệ giao dịch thất bại: Tỷ lệ giao dịch thất bại trong một kỳ sao kê thấp hơn 10%
- Giá trị trung bình của mỗi giao dịch - Average Transaction Value (ATV): ATV phải đạt trên 100 USD
### Nguyên tắc hoàn tiền 
Khách hàng đáp ứng được thể lệ chương trình sẽ được hoàn tiền theo công thức sau:
<p align="center">
<b>Giá trị hoàn tiền (Cashback Amount) = Chỉ tiêu xét hoàn tiền * Tỷ lệ hoàn tiền
</p>
Trong đó, Tỷ lệ hoàn tiền được xác định bằng Chỉ tiêu hoàn tiền theo bảng sau:
| STT  | Chỉ tiêu xét hoàn tiền                                       | Tỷ lệ hoàn tiền |
|------|--------------------------------------------------------------|-----------------|
| 1    | Từ 20,000 USD đến dưới 50,000 USD                            | 0.1%            |
| 2    | Từ 50,000 USD đến dưới 100,000 USD                           | 0.3%            |
| 3    | Từ 100,000 USD đến dưới 500,000 USD                          | 0.4%            |
| 4    | Từ 500,000 USD đến dưới 1,000,000 USD                        | 0.5%            |
| 5    | Từ 1,000,000 USD đến dưới 5,000,000 USD                      | 0.6%            |
| 6    | Trên 5,000,000 USD                                           | 0.7%            |
## Usage
Write about how to use this project.

### Installation
- Steps on how to install this project, to use it.
- Be very detailed here, For example, if you have tools which run on different operating systems, write installation steps for all of them.

```
$ add installations steps if you have to.
```

### Commands
- Commands to start the project.

## Development
If you want other people to contribute to this project, this is the section, make sure you always add this.

### Pre-Requisites
List all the pre-requisites the system needs to develop this project.
- A tool
- B tool

### Development Environment
Write about setting up the working environment for your project.
- How to download the project...
- How to install dependencies...


### File Structure
Add a file structure here with the basic details about files, below is an example.

| No | File Name | Details 
|----|------------|-------|
| 1  | index | Entry point

### Build
Write the build Instruction here.

### Deployment
Write the deployment instruction here.

## Community

If it's open-source, talk about the community here, ask social media links and other links.

### Contribution

 Your contributions are always welcome and appreciated. Following are the things you can do to contribute to this project.

 1. **Report a bug** <br>
 If you think you have encountered a bug, and I should know about it, feel free to report it [here]() and I will take care of it.

 2. **Request a feature** <br>
 You can also request for a feature [here](), and if it will viable, it will be picked for development.  

 3. **Create a pull request** <br>
 It can't get better then this, your pull request will be appreciated by the community. You can get started by picking up any open issues from [here]() and make a pull request.

 > If you are new to open-source, make sure to check read more about it [here](https://www.digitalocean.com/community/tutorial_series/an-introduction-to-open-source) and learn more about creating a pull request [here](https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github).


### Branches

 I use an agile continuous integration methodology, so the version is frequently updated and development is really fast.

1. **`stage`** is the development branch.

2. **`master`** is the production branch.

3. No other permanent branches should be created in the main repository, you can create feature branches but they should get merged with the master.

**Steps to work with feature branch**

1. To start working on a new feature, create a new branch prefixed with `feat` and followed by feature name. (ie. `feat-FEATURE-NAME`)
2. Once you are done with your changes, you can raise PR.

**Steps to create a pull request**

1. Make a PR to `stage` branch.
2. Comply with the best practices and guidelines e.g. where the PR concerns visual elements it should have an image showing the effect.
3. It must pass all continuous integration checks and get positive reviews.

After this, changes will be merged.


### Guideline
coding guidelines or other things you want people to follow should follow.


## FAQ
You can optionally add a FAQ section about the project.

##  Resources
Add important resources here

##  Gallery
Pictures of your project.

## Credit/Acknowledgment
Credit the authors here.

##  License
Add a license here, or a link to it.
