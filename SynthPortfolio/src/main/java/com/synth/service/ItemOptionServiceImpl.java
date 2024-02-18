package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.OptionTypeVO;
import com.synth.dto.ItemOptionDTOList;
import com.synth.mapper.ItemOptionMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemOptionServiceImpl implements ItemOptionService {

	private final ItemOptionMapper itemOptionMapper;

	@Override
	public List<ItemOptionDTOList> getOptionList() {
		// TODO Auto-generated method stub
		return itemOptionMapper.getOptionList();
	}

	@Override
	public List<OptionTypeVO> getOptionType() {
		
		return itemOptionMapper.getOptionType();
	}

	@Override
	public List<ItemOptionDTOList> getOptionCg(Integer option_type_id) {
		// TODO Auto-generated method stub
		return itemOptionMapper.getOptionCg(option_type_id);
	}

	@Override
	public List<ItemOptionDTOList> getOptionValue(Integer option_cg_id) {
		// TODO Auto-generated method stub
		return itemOptionMapper.getOptionValue(option_cg_id);
	}

}


